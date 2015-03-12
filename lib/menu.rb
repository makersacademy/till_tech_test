module Menu

  def price_list
    file = File.read('./hipstercoffee.json')
    JSON.parse(file).first['prices'].first
  end

  def items
    price_list.keys
  end

end
