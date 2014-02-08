class DonationsController < ApplicationController
  before_filter :authenticate_user!

  def give_donation
    recipient = User.find(params[:recipient_id])
    ammount = params[:donation][:ammount]
    if recipient.present? && ammount.present?
      current_user.donate_to(recipient, ammount)
    else
      @error = "Please add ammount"
    end
  end
end
