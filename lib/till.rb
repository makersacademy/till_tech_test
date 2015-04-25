class Till
  def initialize
    @total = 0
    @items = []
  end

  def order(product)
    @total += product.price
    @items << product
  end

  def checkout
    @total
  end

  def count_all_items
    counts = Hash.new(0)
    @items.each { |item| counts[item.name] += 1 }
    counts
  end

  def count(name)
    count_all_items[name]
  end

  def line_items
    line_items = []
    @items.uniq.each do |item|
      line_items << item.name  + " " + count(item.name).to_s + ' x £' + (sprintf "%.2f", item.price)
      # line_items << [item.name, " \t", count(item.name).to_s, ' x £ ', (sprintf "%.2f", item.price)].join('')
    end
    line_items
  end
end
