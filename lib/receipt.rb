require_relative 'product'

class Receipt
  attr_reader :business, :address, :phone, :items, :tax, :total

  def initialize
    @business = ''
    @address = ''
    @phone = ''
    @items = []
    @tax = 0
    @total = 0
  end

  def add_business(name)
    @business = name
  end

  def add_address(address)
    @address = address
  end

  def add_phone(number)
    @phone = number
  end

  def add_header(name, address, number)
    add_business(name)
    add_address(address)
    add_phone(number)
  end

  def add_item(item)
    items << item
  end

  def add_items(list)
    list.each { |item| items << item }
  end

  def add_total(amount)
    @total = amount
  end

  def add_tax(amount)
    @tax = amount
  end
end
