require 'sinatra/base'
require 'json'


class Till < Sinatra::Base

  set :public_folder, 'public'
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

  get '/' do
    file = File.read('hipstercoffee.json')
    cafe_hash = JSON.parse(file).first
    @cafe_name = cafe_hash["shopName"]
    @cafe_address = cafe_hash["address"]
    @cafe_phone = cafe_hash["phone"]
    @cafe_prices = cafe_hash["prices"][0]
    @session = session
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
