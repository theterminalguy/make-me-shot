require 'integration_test_helper'

class VisitorVisitsSite < ActionDispatch::IntegrationTest
  def visit_homepage!
    visit root_url
  end

  test 'visit homepage' do
    visit_homepage!
    assert page.has_field?('link[long]')
    click_button 'Create Link'
  end

  test 'visitor should visit about page' do
    visit '/pages/about'
    assert_equal '/pages/about', current_path
  end

  test 'visitor should visit contact page' do
    visit '/pages/contact'
    assert_equal '/pages/contact', current_path
  end

  test 'visitor should see advertise page' do
    visit '/pages/advertise'
    assert_equal '/pages/advertise', current_path
  end

  test 'visitor should visit sign up page' do
    visit '/register'

    assert_equal '/register', current_path
    assert page.has_content?('Sign Up')

    within '#new_user' do
      fill_in 'user_full_name', with: 'John Doe'
      fill_in 'user_email', with: 'john@doe.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
    end

    click_button 'Register'
  end

  test 'visitor shoudl visit login page' do
    visit '/login'

    assert_equal '/login', current_path

    within '#new_user' do
      fill_in 'user_email', with: 'john@doe.com'
      fill_in 'user_password', with: 'password'
    end

    click_button 'Log in'
  end

  test 'visitor should see popular links' do
    visit_homepage!
    assert page.has_content?('Popular Links')
  end

  test 'visitor should see influential users' do
    visit_homepage!
    assert page.has_content?('Influential Users')
  end

  test 'visitor should see recently added' do
    visit_homepage!
    assert page.has_content?('Recently Added')
  end

  test 'create a short link' do
    visit_homepage!
    fill_in 'link_long', with: 'http://www.google.com.ng'
    click_button 'Create Link'
  end
end
