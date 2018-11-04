User.create!(
  email: "test1@email.com",
  password: "Password",
  password_confirmation: "Password",
  name: "Testuser1",
  roles: "site_admin"
)

puts "1 Admin user created"

User.create!(
  email: "test2@email.com",
  password: "Password",
  password_confirmation: "Password",
  name: "Testuser2",
  roles: "site_admin"
)

puts "2 Admin user created"

User.create!(
  email: "test3@email.com",
  password: "Password",
  password_confirmation: "Password",
  name: "Regular User",
)

  puts "1 regular user created"


