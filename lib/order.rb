class Order

  attr_reader :items

  def initialize
    @items = Hash.new { 0 }
  end

  def add *items_and_quantities
    items_and_quantities.each_with_index do |el, i|
      if el.is_a? Symbol
        if items_and_quantities[i + 1].is_a? Integer
          @items[el] += items_and_quantities[i + 1]
        else
          @items[el] += 1
        end
      end
    end
  end

  def empty?
    @items.empty?
  end

end