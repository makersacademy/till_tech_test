require 'json'

class ReadJson

  def self.parse(file_klass, json_klass, filename)
    self.new(file_klass, json_klass).parse(filename)
  end

  def initialize(file_klass, json_klass)
    @file_klass = file_klass
    @json_klass = json_klass
  end

  def parse(filename)
    json_file = @file_klass.read(filename)
    symbol_keys(@json_klass.parse(json_file))
  end

  private
  def symbol_keys(json_hash)
    json_hash.map{|key,value| [string_to_sym(key), string_to_sym(value)]}.to_h
  end

  def string_to_sym(string)
    return string unless string.is_a? String
    string.gsub(' ','_').downcase.to_sym
  end

end
