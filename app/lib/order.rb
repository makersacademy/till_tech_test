class Order
  attr_reader :list, :confirmed

  def initialize
    @list = {}
    @confirmed = false
  end

  def record_item(item_name, price, quantity)
    if list.has_key?(item_name)
      update_item(item_name, price, quantity)
    else
      list.store(item_name, [quantity, price * quantity])
    end
  end

  def list_of_item_names
    list.keys
  end

  def list_of_item_quantities
    list.values.map(&:first)
  end

  def list_of_item_prices
    list.values.map(&:last)
  end

  def clear_order
    list.clear
  end

  def confirm_order?
    @confirmed = true
  end

  private

  def update_item(item_name, price_to_add, quantity_to_add)
    update_quantity(item_name, quantity_to_add)
    update_price(item_name, price_to_add, quantity_to_add)
  end

  def update_quantity(item_name, quantity_to_add)
    old_quantity = list[item_name].first
    list[item_name][0] = old_quantity + quantity_to_add
  end

  def update_price(item_name, price_to_add, quantity_to_add)
    old_price = list[item_name].last
    list[item_name][1] = old_price + (price_to_add * quantity_to_add)
  end
end
