class Till 
  
  attr_reader :tables,:address,:phone,:tax,
              :shopName,:waiters,:prices,:orders,
              :discount


  def initialize(params={})
    @tables,@address,@phone = params.fetch(:tables),params.fetch(:address),params.fetch(:phone)
    @shopName,@waiters,@tax = params.fetch(:shopName),params.fetch(:waiters),params.fetch(:tax)
    @prices = []
    @orders = []
    @discount ={}
  end  

  def add_item_to_menu(item)
    @prices.push(item)
  end

  def add_order(order)
    @orders << order
  end

  def change(order,amount)
    (amount - order.total_sum*(1+@tax/100.0)).round(2)
  end

  def addDiscount(details)
    @discount = details
  end


end