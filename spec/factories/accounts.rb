require 'faker'

FactoryGirl.define do
  factory :account do
    username {Faker::Name.first_name}
    email {Faker::Internet.email}
    password "qwe123"
    password_confirmation "qwe123"

  end
end