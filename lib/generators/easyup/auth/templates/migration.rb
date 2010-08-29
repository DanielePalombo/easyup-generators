class Create<%= class_name_pluralize %> < ActiveRecord::Migration
  def self.up
    create_table :<%= file_name_pluralize %> do |t|
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token      

      t.timestamps
    end
  end

  def self.down
    drop_table :<%= file_name_pluralize %>
  end
end