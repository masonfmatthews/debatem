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

claims = []
400.times do |i|
  if i % 10 == 0
    parent = nil
    positive = true
    proposition = propositions.sample
  else
    parent = claims.sample
    positive = !parent.positive
    proposition = parent.proposition
  end
  claims << Claim.create!(user: users.sample,
      parent: parent,
      proposition: proposition,
      claim: "No. " + Faker::Company.bs.capitalize,
      data_url: Faker::Internet.url,
      warrant: Faker::Lorem.paragraph,
      positive: positive)
end

1000.times do |i|
  Thumb.create!(claim: claims.sample,
      user: users.sample,
      up: [true, false].sample)
end
