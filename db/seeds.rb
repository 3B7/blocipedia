require 'faker'

rand(10..30).times do
  p = Wiki.create(title: Faker::Lorem.words(rand(1..10)).join(" "))
  rand(3..10).times do
    p.articles.create(title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
  end
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Article.count} articles created"