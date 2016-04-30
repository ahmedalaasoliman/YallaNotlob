class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend
      t.string :group
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
