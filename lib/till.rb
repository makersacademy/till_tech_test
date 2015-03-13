class Till 
  
  attr_reader :tables,:address,:phone,:tax,
              :shopName,:waiters,:menu,:orders


  def initialize(tables,address,phone,shopName,waiters,tax)
    @tables = tables;
    @address = address;
    @phone = phone
    @shopName = shopName
    @waiters = waiters
    @menu = []
    @tax = tax
    @orders = []
  end  

  def add_item_to_menu(item)
    @menu.push(item)
  end

  def add_order(order)
    @orders << order
  end

end