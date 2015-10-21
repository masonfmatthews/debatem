# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Admin", email: "admin@example.com", password: "password")

users = []
10.times do
  users << User.create!(name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password)
end

proposals = []
prefixes = ["I think we should ", "This company needs to ", "It would be best to ", "We definitely should not "]
10.times do
  proposals << Proposal.create!(user: users.sample,
      title: prefixes.sample + Faker::Company.bs,
      body: Faker::Lorem.paragraph)
end

positions = []
1000.times do |i|
  parent = (i % 10 == 0 ? nil : positions.sample)
  parent_agree = (parent ? parent.agree_with_proposal : true)
  agree = [true, false].sample
  agree_with_proposal = (agree ? parent_agree : !parent_agree)
  proposal_id = (parent ? parent.proposal_id : proposals.sample.id)
  positions << Position.create!(user: users.sample,
      parent: parent,
      proposal_id: proposal_id,
      title: Faker::Company.bs,
      body: Faker::Lorem.paragraph,
      agree: agree,
      agree_with_proposal: agree_with_proposal)
end
