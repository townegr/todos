require 'spec_helper'

feature 'user can select and strike through tasks' do

  scenario 'toggle tasks' do
    task = FactoryGirl.create(:task)
    user = FactoryGirl.build(:user)
    sign_in_as(user)
    visit tasks_path

    check('tasks_checkbox[]')
    click_on 'Toggle Tasks'

    expect(page).to have_css('strike')

    check('tasks_checkbox[]')
    click_on 'Toggle Tasks'

    expect(page).to_not have_css('strike')
  end
end
