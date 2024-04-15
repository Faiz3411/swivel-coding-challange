FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "#{Faker::Educator.course_name} #{n}" }
    state { ['Active', 'Not Active'].sample }
    author { Faker::Book.author }
    category
  end
end