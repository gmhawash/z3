class CreateFeeds < ActiveRecord::Migration

  def self.up
    create_table :feeds do |t|
      t.string :name
      t.string :email
      t.text :message
      t.timestamp :date
      t.string :status
      t.integer :position

      t.timestamps
    end

    add_index :feeds, :id

    load(Rails.root.join('db', 'seeds', 'feeds.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "feeds"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/feeds"})
    end

    drop_table :feeds
  end

end
