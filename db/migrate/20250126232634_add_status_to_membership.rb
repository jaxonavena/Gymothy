class AddStatusToMembership < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :status, :integer, default: 0, null: false
  end
end
