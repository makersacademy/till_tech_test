class Order

  attr_reader :customers, :items, :table

  def initialize(options)
    @customers = []
    @items = []
    @table = options[:table]
  end

  def add_item(item)
    @items << item
  end

  def add_customer(customer)
    @customers << customer
  end

end

