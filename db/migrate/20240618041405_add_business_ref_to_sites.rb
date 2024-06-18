class AddBusinessRefToSites < ActiveRecord::Migration[7.0]
  def change
    add_reference :sites, :business, foreign_key: true
  end
end
