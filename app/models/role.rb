class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :wedding
  has_many :tasks, :through => :weddings

  accepts_nested_attributes_for :user

end
