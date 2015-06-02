require 'json'

module ExternalFile

  def extract_file
    json_file = File.read('hipstercoffee.json')
    @hash = JSON.parse(json_file)
  end

  def header
    extract_file
    @hash[0]
  end

  def items_list
    extract_file
    @hash[0]['prices'][0]
  end

end 