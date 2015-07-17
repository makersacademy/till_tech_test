require 'sinatra/base'
require 'json'


class Till < Sinatra::Base

  set :public_folder, 'public'
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

  configure do
    #Tax rate is a magic number so set outside of main code
    set :tax_rate, 8.64
  end

  get '/' do
    file = File.read('hipstercoffee.json')
    cafe_hash = JSON.parse(file).first
    @cafe_name = cafe_hash["shopName"]
    @cafe_address = cafe_hash["address"]
    @cafe_phone = cafe_hash["phone"]
    @cafe_prices = cafe_hash["prices"][0]
    @order_items = []
    @order_quantities = {}
    @order_line_totals = {}
    @cafe_prices.each do |item, price|
      if session.has_key?(item)
        @order_items << item
        @order_quantities[item] = session[item]
        @order_line_totals[item] = session[item] * price
      end
    end
    @order_subtotal = @order_line_totals.values.inject(:+).to_f
    @TAX_RATE = settings.tax_rate
    @order_tax = @order_subtotal * @TAX_RATE / 100
    @order_total = (@order_subtotal + @order_tax).round(2)
    erb :index
  end

  post '/add-to-order' do
    item = params["item"]
    multiplier = params["multiplier"]
    session[item] = multiplier.to_i + session[item].to_i
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
