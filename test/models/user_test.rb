require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test 'user_valid' do
    assert @user.save
  end

  test 'invalid_without_email' do
    @user.email = nil
    refute @user.valid?
  end

  test 'match_email_pattern' do
    assert_match(/^.+@.+$/, @user.email)
  end

  test 'uniqueness_of_email' do
    refute_same @user.email, @user2.email
  end

  test 'invalid_without_full_name' do
    @user.full_name = nil

    refute @user.valid?
  end

  test 'presence_of_encrypted_password' do
    assert @user.encrypted_password
  end

  test 'has_many_links' do
    refute_nil @user.links
  end
end
