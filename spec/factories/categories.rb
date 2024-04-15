FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "#{Faker::Educator.subject} #{n}" }
    state { ['Active', 'Not Active'].sample }
    vertical
  end
end