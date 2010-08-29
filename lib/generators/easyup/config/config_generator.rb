module Easyup
  module Generators
    class ConfigGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      argument :name, :type => :string, :default => "app"

      def generate_initializer
        add_file "config/initializers/config.rb", "require 'ostruct'\nrequire 'yaml'\n\n" unless File.exist?("#{Rails.root}/config/initializers/config.rb")
        append_file "config/initializers/config.rb" do
          string = "#Load #{file_name}_config.yml config file\n"
          string += "config = OpenStruct.new(YAML.load_file(\"\#{Rails.root}/config/#{file_name}_config.yml\"))\n"
          string += "env_config = config.send(Rails.env)\n"
          string += "config.common.update(env_config) unless env_config.nil?\n"
          string += "::#{class_name}Config = OpenStruct.new(config.common)\n\n"          
        end
      end

      def generate_config
        copy_file "config.yml", "config/#{file_name}_config.yml"
      end

    end
  end
end