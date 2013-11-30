class AddDetailsToOfferings < ActiveRecord::Migration
  def change
    add_column :offerings, :details, :text
  end
end
