class AddIsCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_company, :boolean
  end
end
