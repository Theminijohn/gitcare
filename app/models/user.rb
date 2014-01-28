class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook, :twitter, :linkedin]

  has_many :authorizations, :dependent => :destroy

  
  def has_connection_with(provider)
    auth = self.authorizations.where(provider: provider).first
    if auth.present?
      auth.token.present?
    else
      false
    end
  end

  def disconnect(social) 
  	if social == 'facebook' 
  		auth = self.authorizations.where(provider: 'Facebook').first 
  		auth.update_attributes(token: nil, secret: nil) 
  	else 
  		social == 'twitter' 
  		auth = self.authorizations.where(provider: 'Twitter').first 
  		auth.update_attributes(token: nil, secret: nil) 
  	end
  end


end
