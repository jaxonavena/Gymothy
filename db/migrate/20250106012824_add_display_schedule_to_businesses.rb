class AddDisplayScheduleToBusinesses < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :display_schedule, :boolean, default: false
  end
end
