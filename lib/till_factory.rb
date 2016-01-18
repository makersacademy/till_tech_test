require 'read_json'
require 'calculate_total'
require 'receipt_printer'
require 'till'

class TillFactory
  def self.build(filename)
    Till.new(ReadJson, File, JSON, filename, CalculateTotal, ReceiptPrinter)
  end
end
