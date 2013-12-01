class AddAcceptedToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :accepted, :boolean
    add_column :meetups, :cancelled, :boolean
    add_column :meetups, :time1, :datetime
    add_column :meetups, :time2, :datetime
    add_column :meetups, :time3, :datetime
  end
end
