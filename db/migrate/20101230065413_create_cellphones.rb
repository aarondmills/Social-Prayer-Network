class CreateCellphones < ActiveRecord::Migration
  def self.up
    create_table :cellphones do |t|
      t.string :number
      t.boolean :active
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cellphones
  end
end
