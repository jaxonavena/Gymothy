class AddStatusToInterests < ActiveRecord::Migration[7.1]
  def change
    add_column :interests, :status, :string, default: "Interested"
  end
end
