require 'test_helper'

class RedirectControllerTest < ActionController::TestCase
  setup do
    @link = links(:one)
  end

  test 'it redirects to long url' do
    get :show, short_url: @link.short

    assert_redirected_to @link.long
  end

  test 'it redirects to disabled page for disabled url' do
    @link.update_attributes(active: false)
    get :show, short_url: @link.short

    assert_redirected_to '/pages/inactive'
  end

  test 'it redirects to deleted page for unavailable url' do
    get :show, short_url: 'dsfjsdkjfd'

    assert_redirected_to '/pages/deleted'
  end
end
