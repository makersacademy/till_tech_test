require 'json'

class Till

file = File.read('./hipstercoffee.json')
SHOP_DETAILS = JSON.parse(file)

  def initialize()
    @shop_details = SHOP_DETAILS
  end

  def shop_details
    @shop_details
  end

end
