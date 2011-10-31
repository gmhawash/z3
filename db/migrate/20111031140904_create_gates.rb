class CreateGates < ActiveRecord::Migration
  def self.up
    create_table "gates", :force => true do |t|
      t.string   "name"
      t.binary   "image"
      t.string   "symbol"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table "gates"
  end
end
