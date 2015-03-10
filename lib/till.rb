class Till

  attr_accessor :order
  attr_reader :prices

  def initialize
    @tax = 8.64
    @order = []
    get_prices
  end

  def add_order_item(args)
    item = args[:item]
    quantity = args[:quantity]
    order.push({item: item, quantity: quantity})
  end

  def reset_order
    order.clear
  end

  def price_of(item)
    prices[item]
  end

  def get_prices
    file = File.read('./hipstercoffee.json')
    @prices = JSON.parse(file).first['prices'].first
  end

  def line_price(order_line)
    order_line[:quantity] * price_of(order_line[:item])
  end

  def net_total
    order.inject(0){ | memo, n| memo + line_price(n) }
  end

  def order_tax
    (net_total * @tax / 100).round(2)
  end

  def generate_receipt
    receipt = ''
    order.each {|line| receipt << "#{line[:item]} #{line[:quantity]} x #{'%.2f' % price_of(line[:item])},"}
    receipt << "Tax #{order_tax},"
    receipt << "Total #{net_total + order_tax}"
    return receipt
  end

end
