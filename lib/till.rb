require 'json'
require_relative 'receipt'

class Till
  attr_reader :total, :tax, :order_items,  :price_list

  TAXRATE = 8.64

  def initialize
    @business = ''
    @address = ''
    @phone = ''
    @total = 0
    @tax = 0
    @order_items = []
    @price_list = []
  end

  def order(product)
    @total += cost(product)
    @tax += (TAXRATE / 100) * cost(product)
    order_items << product
  end

  def subtotal
    '£' + (format '%.2f', @total)
  end

  def count_all_items
    counts = Hash.new(0)
    order_items.each { |item| counts[item] += 1 }
    counts
  end

  def cost(name)
    (price_list.find { |product| product.name == name }).price
  end

  def count(name)
    count_all_items[name]
  end

  def line_items
    line_items = []
    order_items.uniq.each do |item|
      line_items << item + ' ' + count(item).to_s +
        ' x £' + (format '%.2f', cost(item))
    end
    line_items
  end

  def read_file(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    list = data_hash[0]['prices']
    list[0].each do |name, price|
      price_list << Product.new(name, price)
    end
  end

  def read_header(file_name) # move this to till.rb
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    @business = data_hash[0]['shopName']
    @address = data_hash[0]['address']
    @phone = data_hash[0]['phone']
  end

  # def complete_receipt(receipt)
  #   receipt = []
  #   receipt.read_header('hipstercoffee.json')
  #   receipt.line_items = line_items
  #   receipt.tax = tax.round(2).to_s
  #   receipt.total = (total + tax).round(2).to_s
  # end

  def display_receipt # move to till
    receipt << business << address << phone
    line_items.each { |line_item| receipt << line_item }
    receipt << 'Tax          £' + @tax
    receipt << 'Total        £' + @total
    receipt.flatten
  end
end
