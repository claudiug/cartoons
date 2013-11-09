require 'faker'

FactoryGirl.define do
  factory :cartoon do
    title {Faker::Name.first_name}
    genre "fake"
    #noinspection RubyArgCount
    description {Faker::Company.bs}
    created_by {Faker::Name.last_name}
    language {Faker::Name.prefix}
    country_of_origin {Faker::Address.state_abbr}
    no_of_seasons 4
    no_of_episodes 233
    is_active :true
  end
end