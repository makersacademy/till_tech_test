class Till
  attr_reader :menu
  def initialize(read_json_klass, file_klass, json_klass, filename)
    @menu = read_json_klass.parse(file_klass, json_klass, filename)
  end

end
