require 'rails/generators/migration'

module Easyup
  module Generators
    class AuthGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string, :default => "account"
      class_option :migration, :type => :boolean, :default => true
      class_option :controller, :type => :boolean, :default => true
      class_option :view, :type => :boolean, :default => true
      class_option :routes, :type => :boolean, :default => true
      class_option :helper, :type => :boolean, :default => true
      class_option :scope, :type => :string

      def create_models
        template "session.rb", "app/models/#{file_name}_session.rb"
        template "model.rb", "app/models/#{file_name}.rb"
      end

      def create_migration
        migration_template 'migration.rb', "db/migrate/create_#{table_name}.rb" if options.migration?
      end

      def create_controller
        template "controller.rb", "app/controllers/#{options.scope}/#{file_name}_sessions_controller.rb" if options.controller?
      end

      def create_view
        template "view.rb", "app/views/#{options.scope}/#{file_name}_sessions/new.html.erb" if options.view?
      end

      def add_routes
        if options.routes?
          route "match 'logout' => '#{file_name}_sessions#destroy', :as => :logout"
          route "match 'login' => '#{file_name}_sessions#new', :as => :login, :via => :get"
          route "match 'login' => '#{file_name}_sessions#create', :as => :login, :via => :post"
        end
      end

      def create_lib
        template "lib.rb", "lib/authentication/#{file_name}.rb"
      end

      def configure_controller
        if options.helper?
          if options.scope
            file = "app/controllers/#{scope}/#{scope}_controller.rb"
          else
            file = "app/controllers/application_controller.rb"
          end
          inject_into_class file, :after => :start do
            string = "include Authentication::<%= class_name %>"
            string += "filter_parameter_logging :password, :password_confirmation\n\n"
            string += "helper_method :current_#{file_name}_session, :current_#{file_name}, :#{file_name}_logged_in?, :#{file_name}_logged_out?\n"
          end
        end
      end

      private

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

    end
  end
end