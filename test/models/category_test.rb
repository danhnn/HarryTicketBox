require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "validation of name" do
  	category = Category.new
  	assert_equal category.save, false
  	assert_equal category.errors[:name],"blah"
  end
end
