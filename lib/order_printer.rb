class OrderPrinter
  
  def self.print order
    if order.empty?
      "Nothing ordered yet"
    else
      order.items.map do |item, quantity|
        "#{quantity} x #{item}"
      end.join("\n")
    end
  end
  
end