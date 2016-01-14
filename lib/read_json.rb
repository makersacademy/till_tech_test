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
    @json_klass.parse(json_file)
    true
  end

end
