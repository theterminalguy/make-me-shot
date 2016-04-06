require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_REFERER'] = 'http://test.com/'
    sign_in users(:one)
    @user = users(:one)
    link_params = { long: 'http://google.com.ng', user_id: @user.id }
    @link = Link.create(link_params)
  end

  test 'should get index' do
    get :index
    refute_nil assigns(:links)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create link' do
    assert_difference('Link.count') do
      post :create, link: { long: @link.long,
                            short: @link.short,
                            user_id: @link.user_id
                          }
    end
    assert_redirected_to :back
  end

  test 'should show link' do
    get :show, id: @link
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @link
    assert_response :success
  end

  test 'should update link' do
    patch :update, id: @link, link: { long: @link.long,
                                      short: @link.short,
                                      user_id: @link.user_id
                                    }
    assert_redirected_to @link
  end

  test 'should destroy link' do
    assert_difference('Link.count', -1) do
      delete :destroy, id: @link
    end

    assert_redirected_to user_dashboard_path
  end
end
