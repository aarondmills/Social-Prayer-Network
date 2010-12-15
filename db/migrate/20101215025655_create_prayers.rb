class CreatePrayers < ActiveRecord::Migration
  def self.up
    create_table :prayers do |t|
      t.string :request
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prayers
  end
end
