require 'json'

class Till
  attr_reader :shopName, :address, :phone, :prices

  def initialize
    file = File.read('hipstercoffee.json')
    data = JSON.parse(file)
    @shopName = data[0]['shopName']
    @address = data[0]['address']
    @phone = data[0]['phone']
    @prices = data[0]['prices'][0]
  end
end
