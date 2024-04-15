FactoryBot.define do
  factory :vertical do
    sequence(:name) { |n| "#{Faker::Educator.university} #{n}" }

    after(:create) do |vertical|
      create_list(:category, 3, vertical: vertical)
    end
  end
end