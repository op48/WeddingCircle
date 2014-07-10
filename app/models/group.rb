class Group < ActiveRecord::Base
  belongs_to :wedding
  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_many :tasks

  before_save :create_facebook_group 

  def create_facebook_group
    @graph = Koala::Facebook::API.new(owner.access_token)
    @graph.put_wall_post("Just created a group!", {"name" => "wedding grp", "link" => "http://www.example.com/", "caption" => "{*actor*} posted a new review", "description" => "This is a longer description of the attachment", "picture" => "http://www.example.com/thumbnail.jpg"})
  end

end
