class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.text :review
      t.integer :meetup_id
      t.integer :learner_id

      t.timestamps
    end
  end
end
