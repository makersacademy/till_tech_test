class Order

  attr_reader :contents

  def initialize(*args)
    @contents = args.to_a
  end

end