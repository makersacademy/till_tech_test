class Order

  attr_reader :order

  def initialize(hash)
    @order = hash
  end

  def count_items
    @order.reduce(0){|sum,(k,v)| sum+=v}
  end

end