class PagesController < ApplicationController
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
  end

end
