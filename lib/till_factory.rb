class TillFactory
  def self.build(filename)
    Till.new(ReadJson, File, JSON, filename, CalculateTotal, ReceiptPrinter)
  end
end
