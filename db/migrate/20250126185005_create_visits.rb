class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.references :member, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end

    add_index :visits, [:member_id, :site_id], unique: true
  end
end
