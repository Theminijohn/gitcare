class AddPatronModusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :patron_modus, :boolean, :default => false
  end
end
