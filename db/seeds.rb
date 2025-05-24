admin = User.create!(
  email: 'admin@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Admin',
  last_name: 'User',
  username: 'admin',
  role: 'admin'
)
admin.confirm

# Create sample channels
channels = [
  {
    name: 'General Discussion',
    description: 'General topics and conversations',
    color: '#007bff'
  },
  {
    name: 'Ruby on Rails',
    description: 'Ruby on Rails development discussions',
    color: '#dc3545'
  },
  {
    name: 'JavaScript',
    description: 'JavaScript and frontend development',
    color: '#ffc107'
  },
  {
    name: 'Career Advice',
    description: 'Career guidance and job-related discussions',
    color: '#28a745'
  }
]

channels.each do |channel_attrs|
  Channel.create!(channel_attrs)
end

puts "Created #{User.count} users and #{Channel.count} channels"
