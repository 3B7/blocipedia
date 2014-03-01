require 'faker'
 
wikis = []
1.times do
wikis << Wiki.create(
title: Faker::Lorem.words(rand(1..10)).join(" ")
)
end
 
 
rand(4..10).times do
password = Faker::Lorem.characters(10)
u = User.new(
name: Faker::Name.name,
email: Faker::Internet.email,
password: password,
password_confirmation: password)
u.skip_confirmation!
u.save
 
rand(5..12).times do
wiki = wikis.first
p = u.articles.create(
wiki: wiki,
title: Faker::Lorem.words(rand(1..10)).join(" "),
body: Faker::Lorem.paragraphs(rand(4..6)).join("\n"))
# set the created_at to a time within the past year
p.update_attribute(:created_at, Time.now - rand(600..31536000))
 
wikis.rotate!
end
end
 
 
u = User.new(
name: 'Admin User',
email: 'admin@example.com',
password: 'helloworld',
password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')
 
u = User.new(
name: 'Moderator User',
email: 'moderator@example.com',
password: 'helloworld',
password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')
 
u = User.new(
name: 'Member User',
email: 'member@example.com',
password: 'helloworld',
password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
 
c = Wiki.first.build_collaborator
c.save
 
u.collaborator_id = c.id
u.save

u = User.new(
  name: 'Second Member User',
  email: 'secondmember@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
  u.skip_confirmation!
  u.save
  
p Wiki.first.collaborator.users
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Article.count} articles created"