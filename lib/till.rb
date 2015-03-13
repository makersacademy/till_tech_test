class Till 
  
  attr_reader :tables,:address,:phone,:tax,
              :shopName,:waiters,:menu,:orders


  def initialize(tables,address,phone,shopName,waiters,tax)
    @tables,@address,@phone = tables,address,phone
    @shopName,@waiters,@tax = shopName,waiters,tax
    @menu = []
    @orders = []
  end  

  def add_item_to_menu(item)
    @menu.push(item)
  end

  def add_order(order)
    @orders << order
  end

end