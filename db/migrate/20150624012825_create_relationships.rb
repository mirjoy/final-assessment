class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.string :status
      t.string :action_user_id

      t.timestamps null: false
    end
  end
end
