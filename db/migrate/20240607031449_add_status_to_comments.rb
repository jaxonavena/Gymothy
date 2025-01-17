# frozen_string_literal: true

class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string, default: "public"
  end
end
