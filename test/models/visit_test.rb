require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  setup do
    @visit = visits(:one)
  end
  
  test "valid" do
    assert @visit.save 
  end
  
  test "belongs_to_link" do
    assert @visit.link
  end 
end
