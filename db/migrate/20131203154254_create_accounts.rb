class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true
      t.string :uid
      t.string :username
      t.string :provider
      t.string :oauth_token
      t.string :oauth_secret
      t.datetime :oauth_expires

      t.timestamps
    end
  end
end
