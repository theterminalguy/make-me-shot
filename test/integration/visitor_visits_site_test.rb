require 'integration_test_helper'

class VisitorVisitsSite < ActionDispatch::IntegrationTest
  def setup
    @user = Sample::User.new(email: 'two@test.com')
    @new_user = Sample::User.new(full_name: 'Jackson Mike', email: 'jack@mike.com')
  end

  def driver!
    Capybara.current_driver = :selenium
  end

  def visit_homepage!
    visit root_url
  end

  test 'visit homepage' do
    visit_homepage!
    assert page.has_field?('link[long]')
  end

  test 'create a short link' do
    visit_homepage!
    fill_in 'link_long', with: 'http://www.google.com.ng'
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
  end

  test 'visitor should create an account' do
    driver!
    visit '/register'
    within '#new_user' do
      fill_in 'user_full_name', with: @new_user.full_name
      fill_in 'user_email', with: @new_user.email
      fill_in 'user_password', with: @new_user.password
      fill_in 'user_password_confirmation', with: @new_user.password
    end

    click_button 'Register'
    assert_equal '/dashboard', current_path
  end

  test 'visitor should visit login page' do
    visit '/login'
    assert_equal '/login', current_path
  end

  test 'visitor should login' do
    driver!
    visit '/login'
    within '#new_user' do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    end

    click_button 'Log in'
    assert_equal '/dashboard', current_path
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
end
