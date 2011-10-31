class CreateCircuits < ActiveRecord::Migration
  def self.up
    create_table "circuits", :force => true do |t|
      t.string   "title"
      t.binary   "content"
      t.integer  "num_bits"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "format",     :default => "compact"
    end
  end

  def self.down
    drop_table "circuits"
  end
end
