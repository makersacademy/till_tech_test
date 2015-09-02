require 'sinatra/base'
require './app/lib/till'

class TillApp < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "public") }

  till = Till.new

  get '/' do
    @menu_items = till.menu_read_items
    @order_list = till.order_list
    @receipt = till.print_receipt if till.receipt !=nil
    @change = till.change
    erb :index
  end

  post '/add_order_item?' do
    item = params[:item]
    quantity = params[:quantity]
    till.add_item_to_order(item, quantity.to_i)
    redirect '/'
  end

  get '/print_receipt' do
    till.print_receipt
    redirect '/'
  end

  get '/clear_order' do
    till.new_order
    redirect '/'
  end

  post '/submit_payment?' do
    till.payment(params[:money_tendered].to_i)
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
