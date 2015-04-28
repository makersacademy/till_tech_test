require 'json'

class Receipt
  include Product_list

  def header
    {shopName: data_hash[0]['shopName'], address: data_hash[0]['address'], phone: data_hash[0]['phone']}
  end

  def order_total total, tax
    {total: total, tax: tax}
  end

  def line_order ordered_items
    line_items = []
    ordered_items.each do |key, value|
      line_items << [key.to_s, value[:quantity], value[:total]]
    end
    line_items
  end

  def customer_receipt total, tax_total ,ordered_items
    receipt = {}
    receipt[:header] = header
    receipt[:line_orders] = line_order ordered_items
    receipt[:total] = order_total total, tax_total
    return receipt
  end
end