class Create<%= table_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token      

      t.timestamps
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end