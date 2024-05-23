# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
# User.destroy_all
PostPhoto.destroy_all
PostTag.destroy_all
Post.destroy_all
Tag.destroy_all
Type.destroy_all
User.update_all(photo_id: nil)
Photo.destroy_all
Hoby.destroy_all

# Create some users
# users = User.create([
#   { user_name: 'john_doe', email: 'john@example.com', encrypted_password: 'password1', bio: 'Loves outdoor activities', date_of_birth: '1990-01-15', photo_id: nil },
#   { user_name: 'jane_smith', email: 'jane@example.com', encrypted_password: 'password2', bio: 'Avid reader and writer', date_of_birth: '1985-05-23', photo_id: nil }
# ])
users = User.first(2)

# Create some hobbies
hobies = Hoby.create([
  { title: 'Reading' },
  { title: 'Gardening' },
  { title: 'Cooking' }
])

# Create some photos
photos = Photo.create([
  { media_type: 'image', media_path: '/photos/john.jpg', description: 'Profile picture of John' },
  { media_type: 'image', media_path: '/photos/jane.jpg', description: 'Profile picture of Jane' },
  { media_type: 'image', media_path: '/photos/garden.jpg', description: 'Beautiful garden' }
])

# Assign photos to users
users[0].update(photo_id: photos[0].id)
users[1].update(photo_id: photos[1].id)

# Create some types
types = Type.create([
  { title: 'Blog Post', hoby_id: hobies[0].id },
  { title: 'Photo Gallery', hoby_id: hobies[1].id },
  { title: 'Recipe', hoby_id: hobies[2].id }
])

# Create some posts
# posts = Post.create([
#   { annotation: 'First post about reading', description: 'Reading is a great way to expand your knowledge', user_id: users[0].id, hoby_id: hobies[0].id, type_id: types[0].id },
#   { annotation: 'Gardening tips', description: 'How to grow your own vegetables', user_id: users[1].id, hoby_id: hobies[1].id, type_id: types[1].id },
#   { annotation: 'Delicious recipe', description: 'How to make the perfect pasta', user_id: users[0].id, hoby_id: hobies[2].id, type_id: types[2].id }
# ])
posts = Post.create([
  { description: 'Reading is a great way to expand your knowledge', user_id: users[0].id, hoby_id: hobies[0].id, type_id: types[0].id },
  { description: 'How to grow your own vegetables', user_id: users[1].id, hoby_id: hobies[1].id, type_id: types[1].id },
  { description: 'How to make the perfect pasta', user_id: users[0].id, hoby_id: hobies[2].id, type_id: types[2].id }
])

# Create some tags
tags = Tag.create([
  { title: 'Educational', hoby_id: hobies[0].id },
  { title: 'Tips', hoby_id: hobies[1].id },
  { title: 'Recipe', hoby_id: hobies[2].id }
])

# Assign photos to posts
PostPhoto.create([
  { post_id: posts[1].id, photo_id: photos[2].id }
])

# Assign tags to posts
PostTag.create([
  { post_id: posts[0].id, tag_id: tags[0].id },
  { post_id: posts[1].id, tag_id: tags[1].id },
  { post_id: posts[2].id, tag_id: tags[2].id }
])
