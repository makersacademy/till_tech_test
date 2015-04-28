class Receipt
  include Product_list

  attr_accessor :receipt_header, :order_total

  def header
    @receipt_header = {shopName: data_hash[0]['shopName'], address: "123 Lakeside Way", phone: "16503600708"}
  end

  def order_total total, tax
    @order_total = {total: total, tax: tax}
  end

  def customer_receipt total, tax_total ,ordered_items

  end

end