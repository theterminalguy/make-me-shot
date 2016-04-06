require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test 'it redirects to homepage' do
    assert_routing '/', controller: 'pages', action: 'index'
  end

  test 'index should render correct template' do
    get :index
    assert_template :index
    assert_template layout: 'layouts/application'
  end

  test 'it redirects to about page' do
    assert_routing '/pages/about',
                   controller: 'pages',
                   action: 'show', page: 'about'
  end

  test 'it redirects to contact page' do
    assert_routing '/pages/contact',
                   controller: 'pages',
                   action: 'show',
                   page: 'contact'
  end

  test 'it redirects to advertise' do
    assert_routing '/pages/advertise',
                   controller: 'pages',
                   action: 'show', page: 'advertise'
  end
end
