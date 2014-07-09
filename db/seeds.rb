# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by!(:first_name => "Charlie") do |user|  
  user.last_name = "Brown"
  user.email = "snoopy@email.com"
  user.password = "password"
end

# Wedding.find_or_create_by!(:title => "Ben & Jerry") do |wedding|  
#   wedding.wedding_date = "15 Dec 2014"
# end