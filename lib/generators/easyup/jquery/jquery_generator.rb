module Easyup
  module Generators
    class JqueryGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      class_option :version, :type => :string, :default => 'latest', :desc => "Indicates which JQuery version use"
      class_option :ui, :type => :boolean, :default => true, :desc => "Indicates when to include JQuery-UI"
      class_option :ui_version, :type => :string, :default => '1.8.4', :desc => "Indicates which JQuery-UI version use"
      class_option :theme, :type => :boolean, :default => false, :desc => "Indicates when to Include JQuery default theme (smoothness)"

      def get_jquery
        get "http://code.jquery.com/jquery-#{options.version}.min.js", "public/javascripts/jquery.min.js"
      end

      def get_jquery_ui
         get "http://ajax.googleapis.com/ajax/libs/jqueryui/#{options.ui_version}/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js" if options.ui?
      end

      def get_jquery_ujs
        %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
        get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
      end

      def install_jquery_theme
        directory "smoothness", "public/stylesheets/jquery" if options.theme?        
      end

    end
  end
end