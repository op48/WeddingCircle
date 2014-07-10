class Wedding < ActiveRecord::Base
  has_many :roles
  has_many :tasks
  has_many :groups
  has_many :users, :through => :roles

  accepts_nested_attributes_for :roles

  validates_presence_of :title
  
end


