require 'json'

module Helper

  def load_json(file)
    file = File.read(file)
    JSON.parse(file)[0]
  end  

  def extractShop(json)
    
  end  


end