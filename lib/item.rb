class Item

  attr_reader :name, :price

  def initialize(options)
    @name = options[:name]
    @price = options[:price]
  end

end