require 'json'

module Helper_json

  def load_json(file)
    file = File.read(file)
    JSON.parse(file)[0]
  end  


end