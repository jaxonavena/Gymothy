class ChangeLatitudeAndLongitudeTypesInSites < ActiveRecord::Migration[7.0]
  def up
    change_column :sites, :latitude, :string
    change_column :sites, :longitude, :string
  end

  def down
    change_column :sites, :latitude, :decimal
    change_column :sites, :longitude, :decimal
  end
end
