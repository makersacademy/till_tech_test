class TillController < ApplicationController

  include TillHelper

  def index

  end

  def create
    Item.create(description: params[:item])
    redirect_to root_path
  end

  def destroy
    Item.destroy_all
    redirect_to root_path
  end

  def new
    till = Till.new
    @items = Item.all
    @items.each do |i|
      till.add_item(i.description, 1)
    end
    tender = params[:tender]
    tender.slice!(0)
    till.pay(tender.to_f)
    @receipt = till.receipt
  end

end
