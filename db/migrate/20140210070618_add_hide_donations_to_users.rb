class AddHideDonationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hide_donations, :boolean, :default => false
  end
end
