require 'random_data'

# Create Users
5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

#create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# create sponsored posts
30.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_price
  )
end

# create posts
50.times do
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

#create comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

 post = Post.find_or_create_by(title: "A unique title", body: "A unique body")
 Comment.find_or_create_by(post: post, body: "A unique comment")

#create Questions
100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

100.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy:  RandomData.random_paragraph,
    price: Random.rand(10)
  )
end

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
