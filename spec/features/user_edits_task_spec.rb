require 'spec_helper'

feature 'user edits an existing task' do

  scenario 'edits task' do
    task = FactoryGirl.create(:task)
    user = FactoryGirl.build(:user)
    sign_in_as(user)
    visit tasks_path

    click_on 'Edit'

    expect(page).to have_css('#task_title')

    fill_in 'Task', with: 'return groceries'
    fill_in 'Additional Details', with: 'milk and fruit gone bad'
    click_on 'Change Task'

    expect(current_path).to eq(task_path(task))
    expect(task.title).not_to eq('return groceries')
  end
end
