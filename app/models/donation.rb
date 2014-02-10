class Donation < ActiveRecord::Base

  # This breaks the Dashboard
  # monetize :ammount, as: :ammount

  validates :ammount, presence: true

  belongs_to :donator, class_name: 'User', foreign_key: :user_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id

  TYPE = {
    1 => 'one time',
    2 => 'weekly',
    3 => 'monthly'
  }

end
