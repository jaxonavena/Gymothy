class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
