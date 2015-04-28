class Receipt
  attr_accessor :receipt, :business, :address, :phone, :line_items, :tax, :total

  def initialize
    @receipt = []
    @business = ''
    @address = ''
    @phone = ''
    @line_items = []
    @tax = ''
    @total = ''
  end

  def display
    receipt << business << address << phone
    line_items.each { |line_item| receipt << line_item }
    receipt << 'Tax          £' + @tax
    receipt << 'Total        £' + @total
    receipt.flatten
  end

  def add_line(line)
    line_items << line
  end

  def add_total(amount)
    @total = (format '%.2f', amount)
  end

  def add_tax(amount)
    @tax = (format '%.2f', amount)
  end

  def read_header(file_name)
    file = File.read(file_name)
    data_hash = JSON.parse(file)
    @business = data_hash[0]['shopName']
    @address = data_hash[0]['address']
    @phone = data_hash[0]['phone']
  end
end
