class Status < ActiveRecord::Base

  validates :title, :presence => true
  validates :body, :presence => true, :length => { :maximum => 600 }

end
