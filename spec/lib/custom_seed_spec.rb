require File.expand_path( File.join(File.dirname(__FILE__)  , '../spec_helper' ))

describe "Custom Seed" do

  before(:each) do
    @version_1 =  Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    @version_2 =  Time.now.utc.strftime("%Y%m%d%H%M%S").to_i + 10

  end

  it "should fetch all versions" do
    CustomSeed::CustomSeedMigration.delete_all
    CustomSeed::CustomSeedMigration.create(:version => @version_1)
    CustomSeed::CustomSeedMigration.create(:version => @version_2)
    CustomSeed::Seed.get_all_versions.should include(@version_1)
    CustomSeed::Seed.get_all_versions.should include(@version_2)
  end


  it "should fetch all seeds" do
    create_dir
    create_seed_files
    all_seeds  = CustomSeed::Seed.all_seeds
    all_seeds.collect(&:version).should include(@version_1.to_i)
    all_seeds.collect(&:version).should include(@version_2.to_i)
    remove_dir
  end

  it "should fetch pending seeds" do
    create_dir
    create_seed_files
    CustomSeed::CustomSeedMigration.delete_all
    CustomSeed::CustomSeedMigration.create(:version => @version_2)
    pending_seeds = CustomSeed::Seed.pending_seeds
    pending_seeds.collect(&:version).should include(@version_1)
  end




end