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
      class_option :configure_scope, :type => :boolean, :default => true

      def create_models
        template "session.rb", "app/models/#{file_name}_session.rb"
        template "model.rb", "app/models/#{file_name}.rb"
      end

      def create_migration
        migration_template 'migration.rb', "db/migrate/create_#{file_name_pluralize}.rb" if options.migration?
      end

      def create_controller
        if options.controller?
          if options.scope == "application"
            template "controller.rb", "app/controllers/#{file_name}_sessions_controller.rb"
          else
            template "controller.rb", "app/controllers/#{options.scope}/#{file_name}_sessions_controller.rb"
          end
        end
      end

      def create_view
        if options.view?
          if options.scope == "application"
            template "view.rb", "app/views/#{file_name}_sessions/new.html.erb" if options.view?
          else
            template "view.rb", "app/views/#{options.scope}/#{file_name}_sessions/new.html.erb" if options.view?
          end
        end
      end

      def add_routes
        route "match 'logout' => '#{file_name}_sessions#destroy', :as => :logout"
        route "match 'login' => '#{file_name}_sessions#new', :as => :login, :via => :get"
        route "match 'login' => '#{file_name}_sessions#create', :as => :login, :via => :post"
      end

      def configure_application_controller
        inject_into_class "app/controllers/application_controller.rb", ApplicationController, :befor => :end do
          " filter_parameter_logging :password, :password_confirmation\n
  helper_method :current_#{file_name}_session, :current_#{file_name}, :#{file_name}_logged_in?, :#{file_name}_logged_out?\n"
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