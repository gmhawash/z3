class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string :name
      t.integer :radix
      t.integer :variables
      t.text :content
      t.string :signature
      t.boolean :completed
      t.text :parameters

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
