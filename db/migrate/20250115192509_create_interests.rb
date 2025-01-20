class CreateInterests < ActiveRecord::Migration[7.1]
  def change
    create_table :interests do |t|
      t.references :member, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_index :interests, [:member_id, :event_id], unique: true
  end
end
