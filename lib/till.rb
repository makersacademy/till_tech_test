require 'json'
require_relative 'receipt'

class Till
  attr_reader :business, :address, :phone, :subtotal,
              :tax, :total, :order_items,  :product_list

  TAXRATE = 8.64

  def initialize
    @business = ''
    @address = ''
    @phone = ''
    @subtotal = 0
    @tax = 0
    @total = 0
    @order_items = []
    @product_list = []
  end

  def order(product)
    @subtotal += cost(product)
    @tax += (TAXRATE / 100) * cost(product)
    @total = @subtotal + @tax
    order_items << product
  end

  def count(name)
    count_all_items[name]
  end

  def count_all_items
    counts = Hash.new(0)
    order_items.each { |item| counts[item] += 1 }
    counts
  end

  def cost(name)
    (product_list.find { |product| product.name == name }).price
  end

  def read_product_list(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    list = data_hash[0]['prices']
    list[0].each do |name, price|
      product_list << Product.new(name, price)
    end
  end

  def read_header(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    @business = data_hash[0]['shopName']
    @address = data_hash[0]['address']
    @phone = data_hash[0]['phone']
  end

  def complete_receipt(receipt)
    receipt.add_business(business)
    receipt.add_address(address)
    receipt.add_phone(phone)
    receipt.add_items(order_items)
    receipt.add_tax(tax)
    receipt.add_total(total)
  end

  def display_receipt(receipt)
    output = ''
    output << receipt.business + "\n" + receipt.address + "\n"
    output << 'Phone: ' + receipt.phone + "\n" + "\n"
    receipt.items.uniq.each do |item|
      output << item + ' ' + count(item).to_s + ' x £' +
        (format '%.2f', cost(item)) + "\n"
    end
    output << "\nTax £" + (format '%.2f', receipt.tax.to_s) + "\n"
    output << 'Total £' + (format '%.2f', receipt.total.to_s) + "\n"
  end
end
