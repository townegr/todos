require 'spec_helper'

feature 'user adds a new task' do

  scenario 'adding task' do
    user = FactoryGirl.create(:user)
    prev_count = Task.count
    sign_in_as(user)
    visit tasks_path

    fill_in 'Task', with: 'clean out basement'
    fill_in 'Additional Details', with: 'contact storage facility'
    click_on 'Add Task'

    expect(page).to have_content('clean out basement')
    expect(Task.count).to eq(prev_count + 1)
  end
end
