class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :gname
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
