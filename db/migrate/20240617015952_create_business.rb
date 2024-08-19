# frozen_string_literal: true

class CreateBusiness < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :owner_name
      t.string :owner_phone

      t.timestamps
    end
  end
end
