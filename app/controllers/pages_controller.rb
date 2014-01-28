class PagesController < ApplicationController
  def home
  end

  def about
  end

  def dashboard
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
