require 'faker'

FactoryGirl.define do
  factory :cartoon do
    title "Futurama"
    genre "cool"
    description "some here"
    created_by "me"
    language "en"
    country_of_origin "moon"
    no_of_seasons 4
    no_of_episodes 233
    is_active false
  end
end