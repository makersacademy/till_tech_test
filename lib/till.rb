class Till 
  
  attr_reader :tables,:address,:phone,
                :shopName,:waiters,:menu


  def initialize(tables,address,phone,shopName,waiters)
    @tables = tables;
    @address = address;
    @phone = phone
    @shopName = shopName
    @waiters = waiters
    @menu = []
  end  

  def add_item_to_menu(item)
    @menu.push(item)
  end

end