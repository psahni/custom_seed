
module CustomSeed

  module SeedGeneratorHelper


    def next_migration_number(path)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end

  end

  class Seed

    attr_accessor :timestamped_filename

    class << self

      def execute        
        unless ActiveRecord::Base.connection.table_exists?(CustomSeed::CustomSeedMigration.table_name)
          puts "====  'custom_seeds' table does not exists. Please run rails generate custom_seed:install"
          return false
        end        
        custom_seed = new
        if pending_seeds?
           pending_seeds.each do |seed|
            puts "==== Executing [#{ seed.filename }]"
            seed.run
          end
        else
          puts "No Seed found. Please run 'rails generate custom_seed <filename>'"
        end
      end


      def get_all_versions
        CustomSeedMigration.all.map{|x| x.version.to_i }.sort
      end

      def pending_seeds?
        current_version < last_version
      end

      def pending_seeds
         all_seeds.reject{|s| already_executed.include?(s.version)}
      end


      def all_seeds
        custom_seed_paths(custom_seed_path)
      end

      def last_version
        custom_seed_paths(custom_seed_path).last.try(:version) || 0
      end


      def current_version
        get_all_versions.max || 0
      end


      def already_executed
        @executed_versions||= Set.new(get_all_versions)
      end

      def custom_seed_path
        @custom_seed_path||=('db/custom_seeds')
      end


      def custom_seed_paths(path)
        path  = Array(path)
        files = Dir[*path.map { |p| "#{p}/**/[0-9]*_*.rb" }]
        return [] if files.empty?
        seeds = files.map do |file|
          version, name, scope = file.scan(/([0-9]+)_([_a-z0-9]*)\.?([_a-z0-9]*)?\.rb\z/).first
          raise "Illegal seed" unless version
          version = version.to_i
          name = name.camelize
          SeedExecutor.new(name, version, file, scope)
        end
        seeds.sort_by(&:version)
      end

    end

  end


  class SeedExecutor < Struct.new(:name, :version, :filename, :scope)

    def initialize(name, version, filename, scope)
      super
    end

    def run
       load(filename)
       klass = name.concat('Seed').constantize
       klass.send(:run)
       update_seeds_table
    end

    def update_seeds_table
      CustomSeedMigration.create(:version => self.version)
    end

  end
  
end


