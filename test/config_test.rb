require 'helper'

class ConfigTest < Rails::Generators::TestCase
    tests Easyup::Generators::ConfigGenerator
    destination File.expand_path("../tmp", File.dirname(__FILE__))
    setup :prepare_destination
    
    test 'generator without name' do
      content = run_generator
      assert_file "config/app_config.yml"
    end

    test 'generator with name' do
      name = "contact"
      content = run_generator name
      assert_file "config/#{name}_config.yml"
    end
  end