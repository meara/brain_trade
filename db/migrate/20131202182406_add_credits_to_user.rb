class AddCreditsToUser < ActiveRecord::Migration
  def change
    add_column :users, :credit, :integer, :default => 0
  end
end
