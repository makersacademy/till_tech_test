class TillController < ApplicationController

  def index
  end

  def create
    byebug
    items = params[:items]
    redirect_to '/'
  end

end
