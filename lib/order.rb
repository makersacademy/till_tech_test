class Order

  attr_reader :server, :items

  def initialize(options)
    @server = options[:server]
    @items = options[:items]
  end

end

