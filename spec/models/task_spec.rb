require 'rails_helper'

RSpec.describe Task, :type => :model do

  it { should belong_to(:wedding) }
  it { should belong_to(:group) }

end
