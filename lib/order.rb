class Order

  attr_reader :menu, :bill, :customer, :item, :quantity, :price
  attr_accessor :customer, :cashier

  def initialize(options = {menu: Menu.new})
    @menu = options[:menu]
    @bill = []
  end

  def add(quantity = 1, item)
    @quantity = quantity
    @item = item
    @price = menu.price(item)
    bill << price * quantity
  end

end