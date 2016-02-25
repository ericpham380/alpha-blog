require 'test_helper'

class ListCategories < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Programming")
    @category2 = Category.create(name: "Math")
  end
  
  test "should show categories listing" do 
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    
  end
  
end