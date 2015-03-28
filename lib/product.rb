# would I be better off making this a Struct?

class Product

  attr_reader :name, :price

  def initialize(options={})
    @name = options[:name]
    @price = options[:price]
  end

end