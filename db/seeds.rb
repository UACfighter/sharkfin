puts "Seeding Roles..."
roles = Role.create!([
  { name: 'Admin' },
  { name: 'Editor' },
  { name: 'Author' },
  { name: 'Reader' },
  { name: 'Guest' }
])

puts "Seeding Countries..."
countries = Country.create!([
  { name: 'USA' },
  { name: 'Canada' },
  { name: 'UK' },
  { name: 'Australia' },
  { name: 'Germany' }
])

puts "Seeding Statuses..."
statuses = Status.create!([
  { name: 'Draft' },
  { name: 'Published' },
  { name: 'Archived' },
  { name: 'Pending Review' },
  { name: 'Rejected' }
])

puts "Seeding Categories..."
categories = Category.create!([
  { name: 'Technology', description: 'All about tech innovations and trends.' },
  { name: 'Health', description: 'Tips and articles on wellness and healthcare.' },
  { name: 'Travel', description: 'Guides and experiences from around the world.' },
  { name: 'Food', description: 'Recipes, reviews, and culinary adventures.' },
  { name: 'Education', description: 'Resources and insights for learning and teaching.' },
  { name: 'Lifestyle', description: 'Daily living, culture, and leisure topics.' }
])

puts "Seeding Tags..."
tags = Tag.create!([
  { name: 'Ruby' },
  { name: 'Rails' },
  { name: 'WebDev' },
  { name: 'Programming' },
  { name: 'Tutorial' },
  { name: 'Cloud' },
  { name: 'Database' }
])

puts "Seeding Users and Profiles..."
users = []
5.times do |i|
  user = User.create!(
    name: "User#{i+1}",
    email: "user#{i+1}@example.com",
    role: roles.sample
  )
  Profile.create!(
    user: user,
    country: countries.sample,
    biography: "This is the biography of User#{i+1}. A passionate contributor to our community."
  )
  users << user
end

puts "Seeding Posts and Assigning Tags..."
posts = []
10.times do |i|
  post = Post.create!(
    user: users.sample,
    title: "Sample Post #{i+1}",
    content: "This is the content of sample post #{i+1}. It provides some insight into the topic and serves as example content.",
    category: categories.sample,
    status: statuses.sample
  )
  # Assign 2 to 4 random tags to each post
  post.tags << tags.sample(rand(2..4))
  posts << post
end

puts "Seeding Comments..."
10.times do |i|
  Comment.create!(
    post: posts.sample,
    user: users.sample,
    content: "This is comment #{i+1} on one of the posts. It offers valuable feedback or discussion."
  )
end

puts "Seeding complete!"
