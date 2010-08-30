module Easyup
  module Generators
    class LayoutGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string, :default => "application"
      class_option :stylesheet, :type => :boolean, :default => true, :desc => "Include stylesheet file."
      class_option :jquery, :type => :boolean, :default => false, :desc => "Include JQuery Core, JQuery UI, JQuery UJS and application.js"

      def generate_layout
        template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        invoke "easyup:jquery"
      end

      def generate_stylesheet
        copy_file "stylesheet.css", "public/stylesheets/#{file_name}.css" if options.stylesheet? 
      end

    end
  end
end