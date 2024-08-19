# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.string :manager_name
      t.string :phone

      t.timestamps
    end
  end
end
