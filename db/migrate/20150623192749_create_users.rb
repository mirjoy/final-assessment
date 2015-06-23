class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :email
      t.string :uid
      t.string :github_account
      t.string :description

      t.timestamps null: false
    end
  end
end
