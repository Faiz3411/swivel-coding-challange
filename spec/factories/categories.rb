FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "#{Faker::Educator.subject} #{n}" }
    vertical
  end
end