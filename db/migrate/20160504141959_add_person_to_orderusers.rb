class AddPersonToOrderusers < ActiveRecord::Migration
  def change
    add_column :orderusers, :person, :string
  end
end
