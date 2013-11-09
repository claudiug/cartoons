require 'spec_helper'

describe "Account" do

  it 'is valid with email and username' do
    account = Account.new(username:"claudiu", email:"claudiu@gmail.com", password:"qwe123",
                          password_confirmation: "qwe123")
    expect(account).to be_valid
  end
  it 'is invalid without an email' do
    expect(Account.new(email: nil)).to have(2).errors_on(:email)
end
  it 'is invalid without an username'
  it 'is invalid with a duplicate email'
  it  'is invalid with a non email address format'

  it 'returns a username - email ' do
    account = Account.new(username:"claudiu", email:"claudiu@gmail.com", password:"qwe123",
                          password_confirmation: "qwe123")
    expect(account.name).to eq 'claudiu claudiu@gmail.com'
  end
end