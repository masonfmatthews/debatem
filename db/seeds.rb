# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Chris Lundberg", email: "admin@example.com", password: "password")

users = []
10.times do
  users << User.create!(name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password)
end

propositions = []
prefixes = ["I think we should ", "This company needs to ", "It would be best to "]
10.times do
  propositions << Proposition.create!(user: users.sample,
      title: prefixes.sample + Faker::Company.bs,
      body: Faker::Lorem.paragraph)
end

# positions = []
# 400.times do |i|
#   parent = (i % 10 == 0 ? nil : positions.sample)
#   parent_agree = (parent ? parent.agree_with_proposition : true)
#   agree = [true, false].sample
#   agree_with_proposition = (agree ? parent_agree : !parent_agree)
#   proposition_id = (parent ? parent.proposition_id : propositions.sample.id)
#   positions << Position.create!(user: users.sample,
#       parent: parent,
#       proposition_id: proposition_id,
#       title: (agree ? "Right. " : "No. ") + Faker::Company.bs.capitalize,
#       body: Faker::Lorem.paragraph,
#       agree: agree,
#       agree_with_proposition: agree_with_proposition)
# end
