class Discount

  attr_reader :type, :trigger, :line, :percent

  def initialize(options)
    @type = options[:type]
    @trigger = options[:trigger]
    @line = options[:line]
    @percent = options[:percent]
  end

end

