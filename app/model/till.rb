class Till
  attr_reader :data
  def initialize(data)
    @data = data[0]
  end

  def print_menu
    menu.each{|key, value| p "#{key}, #{value}"}
  end

  private

  def menu
    data["prices"][0]
  end

end
