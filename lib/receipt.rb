require 'module'

class Receipt

  include ExternalFile

  attr_reader :order, :shop_name, :shop_address, :shop_phone, :change

  def initialize(order)
    @order = order
    @shop_name = header['shopName']
    @shop_address = header['address']
    @shop_phone = header['phone']
  end

  def items_total
    order.price * order.quantity
  end

  def amount
    order.bill.reduce(:+)
  end

  def taxes(bill = amount, percentage = 8.64)
    (bill * percentage) / 100
  end

  def total
    (amount + taxes).round(2)
  end

  def receive_payment_of(money)
    @change = (money - total).round(2) if (money > 0 && money > total)
    "Sorry, you still have to pay #{(total - money).round(2)}£ !" if money < total
  end

  # def over_fifty_pound_discount_of(percentage)

  # end
end