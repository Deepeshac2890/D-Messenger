require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup 
    @category = Category.new()
  end

  test "category object should be valid" do
    @category.name = "Sports"
    assert @category.valid?
  end

  test "category object with no name" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "category object with short name" do
    @category.name = "S"
    assert_not @category.valid?
  end

  test "category object with too long name" do
    @category.name = "Too long haiiiiiiiii as limit is high"
    assert_not @category.valid?
  end

  test "category object with duplicate names" do
    @category.name = "Something"
    @category.save
    @category2 = Category.new(name: "Something")
    assert_not @category2.valid?
  end
end