class AddBusinessIdToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :business, null: false, foreign_key: true
  end
end
