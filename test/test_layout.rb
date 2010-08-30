require 'helper'

class TestLayout < Rails::Generators::TestCase
  tests Easyup::Generators::LayoutGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test 'generator layout without name' do
    content = run_generator
    assert_file "app/views/layouts/application.html.erb"
    assert_file "public/stylesheets/application.css"
  end
end