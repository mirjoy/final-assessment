class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :action_user_id
      t.integer :second_user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
