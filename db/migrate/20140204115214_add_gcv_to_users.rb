class AddGcvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gcv, :text
  end
end
