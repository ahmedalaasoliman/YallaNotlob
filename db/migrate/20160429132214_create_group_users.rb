class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :group_id
      t.integer :user_id
      t.references :user, index: true, foreign_key: true
      t.references :groups, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
