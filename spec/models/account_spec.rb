require 'spec_helper'

describe "Account" do

  it 'is valid with email and username' do

    expect(build(:account)).to be_valid
  end
  it 'is invalid without an email' do
    expect(build(:account, email:nil)).to have(2).errors_on(:email)
end
  it 'is invalid without an username'
  it 'is invalid with a duplicate email'
  it  'is invalid with a non email address format'

  it 'returns a username - email ' do
    account = create(:account, username:"claudiu", email:"claudiu@gmail.com")
    expect(account.name).to eq 'claudiu claudiu@gmail.com'
  end
end