require 'rubygems'
require 'bundler'
require 'logger'
require 'rspec'
require 'active_record'

require 'database_cleaner'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'custom_seed'


##################### Active Record Configuration ###########################################

ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.configurations = YAML::load_file(File.dirname(__FILE__) + '/database.yml')
ActiveRecord::Base.establish_connection("sqlite3")

#############################################################################################

ActiveRecord::Base.silence do
  load(File.dirname(__FILE__) + '/custom_seed.rb')
end



RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.mock_with :rspec
  config.order = 'random'
end

#############################################################################################

def create_dir
  require 'fileutils'
  FileUtils.mkdir_p('db/custom_seeds')
end


def remove_dir
  require 'fileutils'
  FileUtils.rm_rf("db")
end

def create_seed_files
  File.new("db/custom_seeds/" + @version_1.to_s + '_test1.rb', 'w')
  File.new("db/custom_seeds/" + @version_2.to_s + '_test2.rb', 'w')
end