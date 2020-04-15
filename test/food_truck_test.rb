require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/food_truck'

class Test < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exists
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Pies", @food_truck.name
  end

  def test_inventory_is_empty
    assert_equal ({}), @food_truck.inventory
  end

  def test_item_is_zero_by_default
    assert_equal 0, @food_truck.check_stock(@item1)
  end

  def test_it_can_stock_items
    @food_truck.stock(@item1, 30)
    assert_equal ({@item1=>30}), @food_truck.inventory
  end

  def test_check_stock_returns_amount
    @food_truck.stock(@item1, 30)
    assert_equal 30, @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 25)
    assert_equal 55, @food_truck.check_stock(@item1)
  end

  def test_it_can_update_inventory
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    assert_equal ({@item1=>55, @item2=>12}), @food_truck.inventory
  end

  def test_it_can_calculate_potential_revenue
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    assert_equal 148.75, @food_truck1.potential_revenue
  end
end
