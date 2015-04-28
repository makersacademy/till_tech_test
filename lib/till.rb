
class Till
  attr_reader :total, :order_items,  :price_list

  def initialize
    @total = 0
    @order_items = []
    @price_list = []
    # @order = Order.new
  end

  def order(product)
    @total += cost(product)
    order_items << product
  end

  def checkout
    '£' + (format '%.2f', @total)
  end

  def count_all_items
    counts = Hash.new(0)
    order_items.each { |item| counts[item] += 1 }
    counts
  end

  def cost(name)
    (price_list.find { |product| product.name == name }).price
  end

  def count(name)
    count_all_items[name]
  end

  def line_items
    line_items = []
    order_items.uniq.each do |item|
      line_items << item + ' ' + count(item).to_s +
        ' x £' + (format '%.2f', cost(item))
    end
    line_items
  end

  def read_file(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    list = data_hash[0]['prices']
    list[0].each do |name, price|
      price_list << Product.new(name, price)
      # price_list.add(Product.new(name, price))
    end
  end
end
