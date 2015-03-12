class Receipt

  attr_reader :order

  def initialize(order)
    @order = order || []
  end

  def contents
    order.items
  end

  def show_breakdown
    Hash[contents.group_by { |k, v| v }.map { |k, v| [k, v.count] }]
  end

end