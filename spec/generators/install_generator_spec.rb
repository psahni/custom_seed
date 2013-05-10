require 'spec_helper'
require 'action_controller'
require 'generator_spec/test_case'
require 'generators/custom_seed/install_generator'

describe CustomSeed::Generators::InstallGenerator do

  include GeneratorSpec::TestCase
  destination File.expand_path("/tmp", __FILE__)
  tests CustomSeed::Generators::InstallGenerator

  before do
    prepare_destination
    run_generator
  end

  it "should created custom_seeds table" do
     table_exits = ActiveRecord::Base.connection.table_exists?('custom_seeds')
     table_exits.should be_true
  end

end

