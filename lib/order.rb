require_relative 'tax'
require_relative 'discount'

class Order

include Tax
include Discount

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
    @current_order[customer][item] >= quantity ? (@current_order[customer][item] -= quantity) : (raise "Quantity can't be negative")
  end

  def total_price_per_item(customer, item)
    item_discounts(item)
    @current_order[customer][item] * item.price * @discount_factor
  end

  def total_price_per_customer(customer)
    total = 0
    @current_order[customer].each {|item, qty| total += item.price * qty }
    total
  end

  def total_pretax_price
    total = 0
    @current_order.each {|customer, item, quantity| total += total_price_per_customer(customer)}
    total_discounts(total)
  end

  def total_tax
    calculate_tax(total_pretax_price) 
  end

  def total_posttax_price
    total_pretax_price + total_tax
  end

  def calculate_change(payment)
    payment >= total_posttax_price ? (payment - total_posttax_price).round(2) : (raise "Payment doesn't cover the price, cough up more dough!")
  end
end