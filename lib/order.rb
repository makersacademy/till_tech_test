class Order

  PRICE_LIST = {cappucino: 3.85, cortado: 4.55}
  attr_reader :total, :items

  def initialize
    @total = 0
    @items = Hash.new { 0 }
  end

  def add item
    @total+= PRICE_LIST[item]
    @items[item] += 1
  end

  def empty?
    @items.empty?
  end
end