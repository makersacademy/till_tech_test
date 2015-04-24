class Order

  attr_accessor :current_order

  def initialize
    @current_order = Hash.new { |l, k| l[k] = Hash.new(&l.default_proc) }
  end

  def add_item_to_order(item, quantity=1, customer)
    @current_order[customer][item] = quantity
  end

  def increase_item_quantity(item, quantity=1, customer)
    @current_order[customer][item] += quantity
  end

  def decrease_item_quantity(item, quantity=1, customer)
    @current_order[customer][item] > 0 ? @current_order[customer][item] -= quantity : raise "already zero"
  end

  def total_pretax_price
    total = 0
    current_order.each {|item, qty| total += item.price * qty }
    total
  end
end