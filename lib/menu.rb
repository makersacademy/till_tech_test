require 'json'
require_relative './module.rb'

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