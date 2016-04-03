require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @link = links(:one)
  end
  
  test "link_valid"do
    assert @link.save 
  end
  
  test "invalid_without_long" do
    @link.long = nil
    
    refute @link.valid? 
  end
  
  test "format_of_long" do
    assert_match(%r{\A^http|https:\/\/}, @link.long)
  end 
  test "valid_without_short" do
    @link.short = nil
    
    assert @link.valid? 
  end
  
  test "presence_of_short_after_save" do
    refute_nil @link.short 
  end
  
  test "short_invalid_if_key_word" do
   arr =  ['login','logout','register','sigup','index',
           'dashboard','links','recent_urls','link',
           'new_short','edit','update','delete','destroy','new', 'show']
   
    refute_includes arr, @link.short
  end
  
  test "has_many_visits" do
    refute_nil @link.visits
  end
  
  
  test "responds_to_to_short_url" do
    assert_respond_to @link, :to_short_url 
  end
  
  test "responds_to_url_slug" do
    assert_respond_to @link, :url_slug 
  end
  
  test "presenece_of_click_count" do
    assert @link.click_count 
  end 
end
