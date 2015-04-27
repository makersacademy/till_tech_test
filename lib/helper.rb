require 'json'

module Helper

  def load_json(file)
    file = File.read(file)
    JSON.parse(file)[0]
  end  

  def extractMenu(hash)
    result = []
    hash.each do |name,price| 
      result << {:name => name, :price => price}
    end
    result
  end

  def extractShop(json)
    result = {}
    json.each do |k,v|
      result[k.to_sym] = v if v.class == String
      result[k.to_sym] = extractMenu(v[0]) unless v.class == String
    end
    result
  end  


end