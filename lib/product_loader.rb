require 'json'

module Product_list
  attr_reader :data_hash

  def initialize
    file = File.read(File.dirname(__FILE__) + "/../hipstercoffee.json")
    @data_hash = JSON.parse(file)
  end
end