require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:user1)
    @user2 = users(:user2)
  end
  
  def test_valid
    assert @user.save 
  end
  
  def test_invalid_without_email
    @user.email = nil 
    refute @user.valid?
  end
  
  def test_match_email_pattern
    assert_match(%r{^.+@.+$}, @user.email)
  end
  
  def test_uniqueness_of_email
    refute_same @user.email, @user2.email 
  end
  
  def test_invalid_without_full_name
    @user.full_name = nil
    
    refute @user.valid? 
  end
  
end
