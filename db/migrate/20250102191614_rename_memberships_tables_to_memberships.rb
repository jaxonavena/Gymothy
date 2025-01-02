class RenameMembershipsTablesToMemberships < ActiveRecord::Migration[7.1]
  def change
    rename_table :memberships_tables, :memberships
  end
end
