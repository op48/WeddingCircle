class User < ActiveRecord::Base
  attr_accessor :provider
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :trackable, :validatable 
  
def email_required?
  #binding.pry
  super && provider.blank?
end

def password_required?
  super && provider.blank?
end
  
end
