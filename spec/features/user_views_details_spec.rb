require 'spec_helper'

feature 'user views additional details of task' do

  scenario 'viewing details' do
    task = FactoryGirl.create(:task)
    user = FactoryGirl.build(:user)
    sign_in_as(user)
    visit tasks_path

    click_on 'More Details'

    expect(page).to have_content(task.description)
  end
end
