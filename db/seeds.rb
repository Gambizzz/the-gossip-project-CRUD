require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

cities = []
10.times do |c|
  city = City.create!(
    name:Faker::Address.city,
    zip_code:Faker::Address.zip_code
  )
  cities << city
  puts "10 villes ont été créées !"
end

10.times do |u|
  User.create!(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    description:Faker::Lorem.sentence(word_count: 20),
    email:Faker::Internet.email,
    age: rand(18..78),
    city: City.all.sample,
    password: Faker::Lorem.paragraph_by_chars(number: 6)
  )
  u +=1
  puts "10 utilisateurs ont été créés !"
end

20.times do |m|
  Gossip.create!(
    user: User.all.sample,
    title:Faker::Movies::StarWars.character,
    content:Faker::TvShows::BigBangTheory.quote,
  )
  m +=1
  puts "20 gossips ont été créés !"
end

10.times do |t|
   Tag.create!(
    title:Faker::Lorem.words
    )
  t +=1
  puts "10 tags ont été créés !"
end

40.times do |pm|
  PrivateMessage.create!(
  content:Faker::Lorem.sentence(word_count: 10),
  sender:User.all.sample,
  recipient:User.all.sample
   )
  pm +=1
  puts "40 messages privés ont été créés !"
end

users = User.all
gossips = Gossip.all
50.times do |c|
  Comment.create!(
   content:Faker::Lorem.sentence(word_count: 10),
   gossip:gossips.sample,
   user:users.sample
   )
 c +=1
 puts "50 comments ont été créés !"
end