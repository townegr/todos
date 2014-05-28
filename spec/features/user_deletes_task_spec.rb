require 'spec_helper'

feature 'user deletes a specific task' do

  scenario 'deleting task' do
    FactoryGirl.create(:task, title: 'call plumber')
    user = FactoryGirl.build(:user)
    task_count = Task.count
    sign_in_as(user)
    visit tasks_path

    expect(page).to have_content('call plumber')

    click_on 'Delete'

    expect(page).to_not have_content('call plumber')
    expect(Task.count).to eq(task_count - 1)
  end
end
