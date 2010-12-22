class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :location, :string
    add_column :users, :avatar, :boolean
  end

  def self.down
    remove_column :users, :avatar
    remove_column :users, :location
    remove_column :users, :lastname
    remove_column :users, :firstname
  end
end
