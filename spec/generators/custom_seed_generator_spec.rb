require 'spec_helper'
require 'action_controller'
require 'generator_spec/test_case'
require 'generators/custom_seed/custom_seed_generator'


describe CustomSeed::Generators::CustomSeedGenerator  do

  include GeneratorSpec::TestCase
  destination File.expand_path("/tmp", __FILE__)
  tests CustomSeed::Generators::CustomSeedGenerator

  before do
    prepare_destination
    run_generator(["test"])
  end

  specify do
    destination_root.should have_structure{
      directory "db" do
        directory "custom_seeds" do
          migration "test"do
            contains "class TestSeed"
            contains "def self.run"
          end
        end
      end
    }
  end


end