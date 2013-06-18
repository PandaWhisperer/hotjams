class User < ActiveRecord::Base
  attr_accessible :name
  has_many :jams
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
