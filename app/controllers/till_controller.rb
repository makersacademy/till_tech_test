class TillController < ApplicationController

  include TillHelper

  def index
    till = Till.new
    @items = Item.all
    @items.each do |i|
      till.add_item(i.description, 1)
    end
    @receipt = till.print_receipt
  end

  def create
    Item.create(description: params[:item])
    redirect_to root_path
  end

  def destroy
    Item.destroy_all
    redirect_to root_path
  end

end
