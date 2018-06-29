# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "yaml"

puts "Cleaning database..."
Post.destroy_all
Comment.destroy_all
User.destroy_all

# Users
puts 'Creating users...'
file = "db/users.yml"
users = YAML.load(open(file).read)

users = users["users"].each do |user|
  u = User.new(user)
  u.save!
end
puts "#{User.count} users have been created"

# Posts
puts 'Creating posts...'
file = "db/posts.yml"
posts = YAML.load(open(file).read)

posts["posts"].each do |post|
  p = Post.new(post)
  p.user = User.first
  p.save!

  if post.key?('comments')
    post["comments"].each do |comment|
    c = Comment.new(comment)
    c.post = p
    c.save!
    end
  end
end
puts "#{Post.count} posts have been created"

# Comments
# puts 'Creating comments...'
# file = "db/comments.yml"
# comments = YAML.load(open(file).read)

# comments["comments"].each do |comment|
#   c = Comment.new(comment)
#   c.post = p
#   c.save!
# end
# puts "#{Comment.count} comments have been created"
