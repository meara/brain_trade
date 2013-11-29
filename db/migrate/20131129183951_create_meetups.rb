class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :offering_id
      t.integer :learner_id
      t.string :method
      t.datetime :date_time

      t.timestamps
    end
  end
end
