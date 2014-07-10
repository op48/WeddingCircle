require 'rails_helper'

RSpec.describe Role, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:wedding) }
  it { should have_many(:tasks).through(:weddings)}

end
