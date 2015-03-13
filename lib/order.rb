class Order

  attr_reader :menu, :bill, :customer, :item, :quantity, :price

  def initialize(options = {menu: Menu.new})
    @menu = options[:menu]
    @customer = options[:customer]
    @bill = []
  end

  def add(quantity = 1, item)
    @quantity = quantity
    @item = item
    @price = menu.price(item)
    bill << price * quantity
  end

end