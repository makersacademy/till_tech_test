class Order

  attr_accessor :current_order

  def initialize
    @current_order = Hash.new { |l, k| l[k] = Hash.new(&l.default_proc) }
  end

  def add_item_to_order(customer, item, quantity=1)
    @current_order[customer][item] = quantity
  end

  def increase_item_quantity(customer, item, quantity=1)
    @current_order[customer][item] += quantity
  end

  def decrease_item_quantity(customer, item, quantity=1)
    if @current_order[customer][item] >= quantity
      @current_order[customer][item] -= quantity
      else
    raise "quantity can't be negative"
    end
  end

  def total_price_per_customer(customer)
    total = 0
    @current_order[customer].each {|item, qty| total += item.price * qty }
    total
  end

  def total_pretax_price
    total = 0
    @current_order.each {|customer, item, quantity| total += total_price_per_customer(customer)}
    total
  end
end