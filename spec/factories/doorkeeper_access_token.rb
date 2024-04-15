FactoryBot.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    association :application, factory: :application
    resource_owner_id { create(:user).id }  # Adjust this according to your user factory setup
    expires_in { 2.hours }
    scopes { "public" }
  end
end