require 'sinatra/base'
require 'json'

class Till < Sinatra::Base

  set :public_folder, 'public'
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

  configure do
    # Tax rate is a magic number so set outside of main code
    set :tax_rate, 8.64
    set :volume_discount_threshold, 5000
    set :volume_discount_rate, 5
    set :muffin_discount_rate, 10
  end

  def pounds(pence)
    pence_text = pence.to_s
    if pence_text.length < 3
      pence_text = "0" * (3 - pence_text.length) + pence_text
    end
    "£#{pence_text[0..-3]}.#{pence_text[-2..-1]}"
  end

  get '/' do

    # Read in the cafe information and menu
    file = File.read('hipstercoffee.json')
    cafe_hash = JSON.parse(file).first
    @cafe_name = cafe_hash["shopName"]
    @cafe_address = cafe_hash["address"]
    @cafe_phone = cafe_hash["phone"]
    @cafe_prices = cafe_hash["prices"][0].map do |item, price|
      [item, price.to_s.ljust(price.to_s.index('.') + 3, '0').delete('.').to_i]
    end

    # Convert menu and prices into a usable format
    @order_items = []
    @order_quantities = {}
    @order_line_totals = {}
    @cafe_prices.each do |item, price|
      if session.key?(item)
        @order_items << item
        @order_quantities[item] = session[item]
        @order_line_totals[item] = (session[item] * price)
      end
    end

    # Calculate current order totals
    @TAX_RATE = settings.tax_rate
    @volume_discount_rate = settings.volume_discount_rate
    @volume_discount_threshold = settings.volume_discount_threshold
    @muffin_discount_rate = settings.muffin_discount_rate

    @order_subtotal = @order_line_totals.values.inject(:+).to_i

    @order_muffin_subtotal = @order_line_totals.select{ |key, value| key.include?('Muffin') }.values.inject(:+).to_i
    @order_muffin_discount_amount = (@order_muffin_subtotal * @muffin_discount_rate / 100).to_i
    @order_total = @order_subtotal - @order_muffin_discount_amount

    if @order_total >= @volume_discount_threshold
      @volume_discount = true
      @volume_discount_amount = (@order_total * @volume_discount_rate / 100).to_i
      @order_total -= @volume_discount_amount
    else
      @volume_discount = false
      @volume_discount_amount = 0
    end

    @order_tax = (@order_total * @TAX_RATE / 100).to_i
    @order_total += @order_tax

    erb :index
  end

  post '/add-to-order' do
    item = params["item"]
    multiplier = params["multiplier"]
    session[item] = multiplier.to_i + session[item].to_i
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
