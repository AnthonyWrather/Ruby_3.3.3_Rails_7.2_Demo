# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "tony@tony.com", password: "password", password_confirmation: "password", name: "Tony")
User.create(email: "test@test.com", password: "password", password_confirmation: "password", name: "Test")

5.times do |x|
  Post.create(title: "Title #{x+1}", body: "Body #{x+1}", user_id: User.first.id)
end

5.times do |x|
  Post.create(title: "Title #{x+6}", body: "Body #{x+6}", user_id: User.last.id)
end
