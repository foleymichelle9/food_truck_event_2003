class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|food_truck| food_truck.inventory.include?(item)}
  end

  def find_total_food_items
    total_food_items = []
    @food_trucks.each do |food_truck|
      total_food_items << food_truck.inventory.keys
    end
    total_food_items = total_food_items.flatten.uniq
  end

  def find_item_quantity(item)
   x = items_and_quantity
   x[item]
  end

  def items_and_quantity
    total_food_items = []
    @food_trucks.each do |food_truck|
      total_food_items << food_truck.inventory
    end
    total_food_items = total_food_items.flatten.uniq

    items_quantity = {}
    total_food_items.each do |items|
      items.each do |item|
        if items_quantity.has_key?(item.first)
          items_quantity[item.first] += item.last
        else
          items_quantity[item.first] = item.last
        end
      end
    end
    items_quantity
  end

  def total_inventory
    event_items = {}
   find_total_food_items.each do |item|
     event_items[item] = {quantity: find_item_quantity(item),
                           food_trucks: food_trucks_that_sell(item)}
   end
   event_items
  end

  def overstocked_items
    over_stocked = total_inventory.find_all do |items|
      items[1].values.first > 50 && items[1].values.last.length > 1
    end.flatten
      [over_stocked.first]
  end

  def sorted_item_list
    find_total_food_items.map {|item| item.name}.sort
  end
end
