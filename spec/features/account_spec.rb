require 'spec_helper'

feature 'Account' do

  scenario 'login' do
    account = create(:account)
    visit login_path
    fill_in "email", with: account.email
    fill_in "password", with: account.password
    fill_in "password_confirmation", with: account.password_confirmation
    click_button 'go now'

  end
end