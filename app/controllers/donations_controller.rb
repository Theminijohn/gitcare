class DonationsController < ApplicationController
  before_filter :authenticate_user!

  def give_donation
    recipient = User.find(params[:recipient_id])
    amount = params[:donation][:ammount]

    if recipient.present? && amount.present?
      current_user.donate_to(recipient, amount)

      Stripe::Plan.create(
        :amount => amount,
        :interval => 'month',
        :name => "Donation to #{recipient.customer_id}",
        :currency => 'usd',
        :id => "donation_to_cusomer_#{recipient.customer_id}"
      )

      customer = Stripe::Customer.retrieve(current_user.customer_id)
      customer.subscriptions.create(:plan => "donation_to_cusomer_#{recipient.customer_id}")

    else
      @error = "Please add ammount"
    end
  end
end
