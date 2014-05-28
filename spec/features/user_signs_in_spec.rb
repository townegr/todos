require 'spec_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can enter my system
} do

  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(current_path).to eq(tasks_path)
  end
end
