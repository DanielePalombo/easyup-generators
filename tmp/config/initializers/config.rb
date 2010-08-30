require 'ostruct'
require 'yaml'

#Load app_config.yml config file
config = OpenStruct.new(YAML.load_file("#{Rails.root}/config/app_config.yml"))
env_config = config.send(Rails.env)
config.common.update(env_config) unless env_config.nil?
::AppConfig = OpenStruct.new(config.common)

