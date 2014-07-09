class Wedding < ActiveRecord::Base
  has_many :roles
  has_many :users, :through => :roles
  has_many :tasks

  accepts_nested_attributes_for :roles
end


