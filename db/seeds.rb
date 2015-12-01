# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do 
password = Faker::Internet.password(8)
User.create(:username => Faker::Internet.user_name, :email => Faker::Internet.free_email, :password => password, :password_confirmation => password, :city => "Toronto") 

end

5.times do Company.create(:company_name => Faker::Company.name) 

end

10.times do Discount.create(:discount_percent => Faker::Number.between(5, 40), 
  :user_id => Faker::Number.between(1, 5), :company_id => Faker::Number.between(1, 5), :restrictions => Faker::Lorem.sentence) 

end