class AddVanityUrl < ActiveRecord::Migration
  def change
  	add_column :shorteners, :vanity_url, :string
  end
end
