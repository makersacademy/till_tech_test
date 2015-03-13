require 'json'
require 'module'

class Menu

  include ExternalFile

  attr_reader :list

  def initialize
    @list = items_list
  end

  def price(item)
    list[item] if list.include?(item)
  end
end