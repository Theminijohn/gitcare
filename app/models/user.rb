require 'role_model'
class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :confirmable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  has_many :authorizations, :dependent => :destroy

  validates :first_name, :presence => true
  validates :username, :presence => true, :uniqueness => true, :length => { :minimum => 3 }
  validates :slogan, :length => { :maximum => 200 }

  # Avatar
  has_attached_file :avatar, :styles => { :profile => "160x160#", :thumb => "50x50#"},
                    :default_url => "http://i.imgur.com/DvWJNJI.png"

  # Cover
  has_attached_file :cover, :styles => { :profile => "970x250#" },
                    :default_url => "http://i.imgur.com/5jSh4fI.jpg"

  # Friendly_id
  extend FriendlyId
  friendly_id :username, :use => [:slugged, :finders]

  # Role Model
  # do not change the order if you add more roles later,
  # always append them at the end!
  include RoleModel
  roles_attribute :roles_mask
  roles :admin, :banned, :suspicious


  # Check connection buttons on Dashboard
  def has_connection_with(provider)
    auth = self.authorizations.where(provider: provider).first
    if auth.present?
      auth.token.present?
    else
      false
    end
  end

  # Social links in Profile
  def has_social_links?
    tauth = self.authorizations.where(:provider => 'Twitter')
    fauth = self.authorizations.where(:provider => 'Facebook')
    if tauth.present? || fauth.present?
      return true # Return true if true
    end
    false # Otherwise, return false
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
