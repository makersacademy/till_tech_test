require 'transaction'

class Till

  def initialize
    @transaction = Transaction.new
  end

  attr_reader :transaction

end