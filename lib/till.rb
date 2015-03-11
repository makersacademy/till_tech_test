class Till 
  
  attr_accessor :tables,:address,:phone,:shopName,:waiters

  def initialize(tables,address,phone,shopName,waiters)
    @tables = tables;
    @address = address;
    @phone = phone
    @shopName = shopName
    @waiters = waiters
  end  

end