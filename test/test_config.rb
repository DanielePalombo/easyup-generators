require 'helper'

class TestConfig < Rails::Generators::TestCase
  tests Easyup::Generators::ConfigGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test 'generator config without name' do
    content = run_generator
    assert_file "config/app_config.yml"
  end

  test 'generator config with name' do
    name = "contact"
    content = run_generator name
    assert_file "config/#{name}_config.yml"
  end
end