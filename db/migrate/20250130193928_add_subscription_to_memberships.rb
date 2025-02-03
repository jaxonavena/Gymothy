class AddSubscriptionToMemberships < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :subscription, :integer, null: false, default: 0
  end
end
