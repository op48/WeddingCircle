class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :wedding

  accepts_nested_attributes_for :user

end
