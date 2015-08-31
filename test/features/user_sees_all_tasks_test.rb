require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_front_page_has_content
    visit '/'
    assert page.has_content?("Welcome to your Task Manager")
  end

  def test_user_can_create_a_task
    visit '/tasks/new'
    fill_in('task[title]', :with =>'Add Tests')
    fill_in('task[description]', :with =>'Good Coverage!')
    click_button('Submit')
    assert_equal '/tasks', current_path
    assert page.has_content?('Add Tests')
  end

  def test_user_can_edit_a_task
    skip
    visit '/tasks/new'
    fill_in('task[title]', :with =>'Add Tests')
    fill_in('task[description]', :with =>'Good Coverage!')
    click_button('Submit')
    visit '/tasks/1/edit'
    fill_in('task[title]', :with =>'Updated Tests')
    fill_in('task[description]', :with =>'This test has been updated!')
    click_button('Submit')
    assert_equal '/tasks/1', current_path
    assert page.has_content?('This test has been updated!')
  end
end