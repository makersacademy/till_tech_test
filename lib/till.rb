require 'transaction'

class Till

  def initialize
    new_transaction
  end

  def new_transaction
    @transaction = Transaction.new
  end

  attr_reader :transaction

end
