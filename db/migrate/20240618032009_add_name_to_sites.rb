# frozen_string_literal: true

class AddNameToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :name, :string
  end
end
