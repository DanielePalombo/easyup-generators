require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'easyup-generators'
require 'generators/easyup/config/config_generator'
require 'generators/easyup/layout/layout_generator'

class Test::Unit::TestCase
end
