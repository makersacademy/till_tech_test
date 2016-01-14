class Till
  attr_reader :data
  def initialize(data)
    @data = data[0]
  end

  def print_menu
    menu.each{|key, value| "#{key}, #{value}"}
  end

  def calculate_line_total(line)
    line[get_line_key(line)]*menu[get_line_key(line).to_s]
  end

  def calculate_total(order)
    total = 0
    order[:items].each{|order_item| total += calculate_line_total(order_item)}
    total.round(2)
  end

  private

  def menu
    data["prices"][0]
  end

  def get_line_key(line)
    line.keys[0]
  end

end
