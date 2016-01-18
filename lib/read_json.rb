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
    symbol_keys(unwrap_array(@json_klass.parse(json_file)))
  end

  private
  def symbol_keys(json_hash)
    return symbol_keys(json_hash.first) if json_hash.is_a?(Array) && json_hash.length == 1 && json_hash.first.is_a?(Hash)
    json_hash.map{|key, value| [string_to_sym(key), string_to_sym(value)]}.to_h
  end

  def string_to_sym(string)
    return symbol_keys(string) if string.is_a? Hash
    return string unless string.is_a? String
    string.gsub(' ','_').downcase.to_sym
  end

  def unwrap_array(json_hash)
    return json_hash if not json_hash.is_a? Array
    json_hash.first.map{|key, value| [key, unwrap_array(value)]}.to_h
  end

end
