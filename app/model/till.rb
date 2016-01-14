class Till
  attr_reader :data, :tax, :order_total
  DEFAULT_TAX = 8.64

  def initialize(data, tax = DEFAULT_TAX)
    @data = data[0]
    @tax = tax
    @order_total = 0
  end

  def calculate_line_total(line)
    if line.keys[0].to_s.include?("Muffin")
      price = (price(line) * 0.9).round(2)
    else
      price = price(line)
    end
    quantity(line) * price
  end

  def calculate_base_total(order)
    order[:items].inject(0) do |total, order_item|
      total + (calculate_line_total(order_item))
    end
      .round(2)
  end

  def calculate_tax(order_amount)
    (order_amount * to_percent(tax)).round(2)
  end

  def calculate_total_discount(base)
    base > 50 ? base *= 0.95 : base
  end

  def total(order)
    base = calculate_total_discount(calculate_base_total(order))
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

  def quantity(line)
    line[get_line_key(line)]
  end

  def price(line)
    menu[get_line_key(line).to_s]
  end

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
