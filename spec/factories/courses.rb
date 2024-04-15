FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "#{Faker::Educator.course_name} #{n}" }
    category
  end
end