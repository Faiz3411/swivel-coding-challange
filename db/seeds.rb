# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
Doorkeeper::Application.find_or_create_by(name: "Swivel-coding-challange") do |app|
  app.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
  app.secret = "my_secret" 
  app.uid = "my_uid"
  app.save!
end

User.create(email: "test@example.com", password: "12345678")

5.times do
  vertical = Vertical.create!(name: Faker::Company.industry)
  3.times do
    category = vertical.categories.create!(name: Faker::Commerce.department, state: ['Active', 'Not Active'].sample)
    5.times do
      course = category.courses.create!(name: Faker::Educator.course_name,
                                         state: ['Active', 'Not Active'].sample,
                                         author: Faker::Book.author)
    end
  end
end

