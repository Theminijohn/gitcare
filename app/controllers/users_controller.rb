class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @donation_types = Donation::TYPE.collect{|a| [a[1], a[0]]}
  end


  # Dissconnect the Verified Social Account
  def disconnect
  	social = params[:social]
 		current_user.disconnect(social)
 		redirect_to :back
  end

end
