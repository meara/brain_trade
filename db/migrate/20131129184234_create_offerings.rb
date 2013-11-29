class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :subject_id
      t.integer :teacher_id
      t.boolean :hangout
      t.string :location

      t.timestamps
    end
  end
end
