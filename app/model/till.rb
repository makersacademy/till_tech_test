class Till
  attr_reader :data, :tax, :order_total
  DEFAULT_TAX = 8.64

  def initialize(data, tax = DEFAULT_TAX)
    @data = data[0]
    @tax = tax
    @order_total = 0
  end

  def calculate_line_total(line)
    line[get_line_key(line)]*menu[get_line_key(line).to_s]
  end

  def calculate_base_total(order)
    total = 0
    order[:items].each{|order_item| total += calculate_line_total(order_item)}
    total.round(2)
  end

  def calculate_tax(order_amount)
    (order_amount * to_percent(tax)).round(2)
  end

  def total(order)
    base = calculate_base_total(order)
    tax = calculate_tax(base)
    @order_total = (base + tax).round(2)
  end

  def take_payment(amount)
    change = 0
    if amount > order_total
      change = amount - order_total
      @order_total = 0
    else
      fail "The amount given is less than the cost of the order"
    end
    change.round(2)
  end


  private

  def menu
    data["prices"][0]
  end

  def get_line_key(line)
    line.keys[0]
  end

  def to_percent(number)
    number / 100
  end

end
