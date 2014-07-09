class Task < ActiveRecord::Base
  belongs_to :wedding
  has_many :roles, :through => :weddings
end
