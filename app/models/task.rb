class Task < ActiveRecord::Base
  belongs_to :wedding
  belongs_to :group
end
