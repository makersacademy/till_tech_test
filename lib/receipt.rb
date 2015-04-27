class Receipt
  attr_reader :lines, :total

  def initialize
    @lines = []
    # @tax
    @total = 0
  end
end
