class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :user_id, index: true
      t.integer :total_ammount

      t.timestamps
    end
  end
end
