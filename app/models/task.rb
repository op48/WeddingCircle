class Task < ActiveRecord::Base
  belongs_to :wedding
  belongs_to :group
  has_many :roles, :through => :weddings

end
