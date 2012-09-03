class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.string :url, :null => false
      t.string :slug

      t.timestamps
    end

    add_index :webpages, :slug, :unique => true
  end
end
