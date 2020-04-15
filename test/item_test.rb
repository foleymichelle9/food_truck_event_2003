require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/food_truck'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  def test_it_exists
    assert_instance_of Item, @item1
  end

  def test_it_has_a_name
    assert_equal "Apple Pie (Slice)", @item2.name
  end

  def test_it_has_a_price
    assert_equal 2.50, @item2.price
  end
end
