class PagesController < ApplicationController

  #layout 'home', :only => :home

  def home
  end

  def about
  end

  def dashboard
    # Only for registered users
    unless user_signed_in?
      redirect_to root_path
    end
  end

  # After Sign up
  def welcome
    # Dont let users review this page once they logged in again
    # if current_user.sign_in_count > 1
    #   redirect_to root_path
    # end
  end

  def almost_done
  end

end
