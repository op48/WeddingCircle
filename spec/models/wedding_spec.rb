require 'rails_helper'

RSpec.describe Wedding, :type => :model do

  it { should have_many(:roles) }
  it { should have_many(:tasks) }
  it { should have_many(:groups) }
  it { should have_many(:users).through(:roles)}
  it { should accept_nested_attributes_for(:roles)}
  it { should validate_presence_of(:title) }

end
