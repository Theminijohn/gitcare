class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook, :twitter, :linkedin]

  has_many :authorizations, :dependent => :destroy

  validates :first_name, :presence => true
  validates :username, :presence => true, :uniqueness => true

  # Avatar
  has_attached_file :avatar, :styles => { :profile => "160x160#", :thumb => "50x50#"}

  # Friendly_id
  extend FriendlyId
  friendly_id :username, :use => [:slugged, :finders]

  
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

  def username=(value)
    self[:username] = value.to_s.squish
  end

end
