class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id, index: true
      t.integer :wallet_id, index: true
      t.integer :recipient_id
      t.integer :recipient_wallet_id
      t.integer :ammount
      t.integer :donation_type

      t.timestamps
    end
  end
end
