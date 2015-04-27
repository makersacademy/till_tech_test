require 'json'

module Product_list
  file = File.read(File.dirname(__FILE__) + "/../'hipstercoffee.json")
  data_hash = JSON.parse(file)
end