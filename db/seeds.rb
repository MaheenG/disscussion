# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ye file database ko initial data se populate krne k liye hai
# Development aur testing k liye dummy data create krta hai

# Create default channels
Channel.create([
  { channel: 'General Discussion' },
  { channel: 'Help & Support' },
  { channel: 'Announcements' },
  { channel: 'Ideas & Feedback' },
  { channel: 'Off-Topic' }
]) unless Channel.exists?

# Admin user create krta hai - full access k sath
admin = User.create!(
  username: 'admin',
  email: 'admin@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: true
)

# Normal user create krta hai - limited access k sath
user = User.create!(
  username: 'user',
  email: 'user@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create channels
channels = [
  'General Discussion',
  'Programming',
  'Ruby on Rails',
  'JavaScript',
  'Career Advice',
  'Tech News'
].map do |name|
  Channel.create!(name: name)
end

# Create sample discussions
channels.each do |channel|
  5.times do |i|
    discussion = Discussion.create!(
      title: "#{channel.name} Discussion #{i + 1}",
      content: "This is a sample discussion for #{channel.name}. It includes some markdown:\n\n" \
              "## Key Points\n\n" \
              "* Point 1\n" \
              "* Point 2\n\n" \
              "```ruby\n" \
              "def hello_world\n" \
              "  puts 'Hello, World!'\n" \
              "end\n" \
              "```",
      user: [admin, user].sample,
      channel: channel
    )

    # Add some replies
    3.times do |j|
      Reply.create!(
        body: "This is reply #{j + 1} to the discussion. It may include some code: `puts 'Hello!'`",
        discussion: discussion,
        user: [admin, user].sample
      )
    end
  end
end

# Default channel create krta hai discussions k liye
channel = Channel.create!(name: 'General Discussion')

# Sample discussion create krta hai
discussion = Discussion.create!(
  title: 'Welcome to the Discussion Forum!',
  content: 'This is our first discussion. Feel free to reply and engage with other users!',
  user: admin,
  channel: channel
)

# Sample reply create krta hai discussion mein
Reply.create!(
  reply: 'Thank you for creating this forum! Looking forward to great discussions.',
  discussion: discussion,
  user: user
)

puts "Seed data created successfully!"
puts "Admin login: admin@example.com / password123"
puts "User login: user@example.com / password123"
