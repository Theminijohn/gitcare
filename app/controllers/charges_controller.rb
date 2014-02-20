class ChargesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
  end

  def add_amount_to_wallet
    user = current_user
    @amount = params[:amount].to_i

    customer = Stripe::Customer.retrieve(user.customer_id)
    customer.cards.create(:card => params[:stripeToken])

    charge = Stripe::Charge.create(customer: customer.id, amount: @amount,
      description: "Update Wallet - id: #{user.id}, customer_id: #{user.customer_id}",
      :currency    => 'usd'
      )

    old_amount = customer.account_balance.to_i
    new_amount = @amount + old_amount
    customer.account_balance = new_amount
    customer.save
  end
end
