class CreateGusers < ActiveRecord::Migration
  def change
    create_table :gusers do |t|
      t.integer :user_id
      t.integer :group_id
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
