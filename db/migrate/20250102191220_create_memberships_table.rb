class CreateMembershipsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships_tables do |t|
      t.references :member, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
