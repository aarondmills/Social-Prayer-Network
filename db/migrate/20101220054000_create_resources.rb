class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
