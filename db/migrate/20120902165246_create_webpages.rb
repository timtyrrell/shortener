class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.string :url, :null => false
      t.string :slug, :null => false

      t.timestamps
    end
  end
end
