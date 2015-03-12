module Menu

  attr_reader :price_list

  def read_price_list
    file = File.read('./hipstercoffee.json')
    @price_list = JSON.parse(file).first['prices'].first
  end

  def items
    price_list.keys
  end

end
