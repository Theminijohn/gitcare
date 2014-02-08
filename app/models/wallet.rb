class Wallet < ActiveRecord::Base
  monetize :total_ammount, :as => "ammount"

  belongs_to :user
  has_many :outgoing_donations, class_name: 'Donation', foreign_key: :wallet_id
  has_many :incoming_donations, class_name: 'Donation', foreign_key: :recipient_wallet_id
end
