class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
      t.references :user
      t.string :url
      t.string :short_url
      t.integer :visit_count, :default => 0

      t.timestamps
    end
  end
end
