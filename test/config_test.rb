require 'helper'

class ConfigTest < Rails::Generators::TestCase
    tests Easyup::Generators::ConfigGenerator
    destination File.expand_path("../tmp", File.dirname(__FILE__))
    setup :prepare_destination
    
    test 'config generator' do
      content = run_generator
      assert_file "config/app_config.yml"
    end
  end