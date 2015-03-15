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

  # eg.{50=>5,item1=>10} above 50.0  5% discount
  #                         item1 10% discount
  def addDiscount(details)
    @discount = details
  end

  def discountedList(order)
    itemsSum = order.items_sum
    itemsSum.each do |item,amount|
      itemsSum[item] = (amount*(1.0 - @discount[item]/100.0)).round(2) if @discount[item]
    end
    itemsSum    
  end

  def discountedTotal(order)
    listSums = discountedList(order)
    totalWithoutDisount = listSums.reduce(0) { |sum,(item,value)| sum+=value} #calulate the sum
    totalDisc = @discount.select{|k,v| (k.class == Float || k.class == Fixnum)} #selects total discounts
    disc = totalDisc.select{|k,v| totalWithoutDisount > k}.max_by{|k,v| k} #takes the ap. discout pct
    totalWithoutDisount *= (1.0 - disc[1]/100.0) if disc
    totalWithoutDisount 
  end


end