class User < ActiveRecord::Base
  attr_accessible :name, :auth_token, :fb_id
  has_many :jams
  validates_uniqueness_of :fb_id, :on => :create, :message => "must be unique"
end
