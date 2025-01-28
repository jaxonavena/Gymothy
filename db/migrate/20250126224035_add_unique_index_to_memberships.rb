class AddUniqueIndexToMemberships < ActiveRecord::Migration[7.1]
  def change
    add_index :memberships, %i[member_id business_id], unique: true
  end
end