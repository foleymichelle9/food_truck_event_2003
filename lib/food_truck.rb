class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  #the sum of all their items' price * quantity.
  def potential_revenue
    @inventory.inject(0) do |total, inventory|
      total += inventory.first.price * inventory.last
    end
  end
end
