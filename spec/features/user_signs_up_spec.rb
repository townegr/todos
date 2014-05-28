require 'spec_helper'

feature 'user registration', %Q{
  As an unauthenticated user
  I want to securely register an account
  So that I can track my work productivity
} do

  let(:user) { FactoryGirl.build(:user) }

  scenario 'user signs up' do
    visit root_path
    click_on 'Sign Up'

    fill_in 'user_email', with: user.email
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation

    within('form') do
      click_on 'Sign Up'
    end

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq(tasks_path)
  end
end
