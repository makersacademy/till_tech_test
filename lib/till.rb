class Till

  attr_reader :company_name, :address, :phone, :prices

  def initialize(options)
    @company_name = options[:name]
    @address = options[:address]
    @phone = options[:phone]
    @prices = options[:prices]
  end

  def place_order(order)
    { name: company_name,
      address: address,
      phone: phone
    }
  end

end
