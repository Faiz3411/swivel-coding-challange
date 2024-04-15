FactoryBot.define do
  factory :application, class: 'Doorkeeper::Application' do
    name { "Swivel-coding-challange" }
    redirect_uri { "urn:ietf:wg:oauth:2.0:oob" }
    confidential { true }
  end
end