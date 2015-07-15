require 'sinatra/base'
require 'json'


class Till < Sinatra::Base

  set :public_folder, 'public'
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    file = File.read('hipstercoffee.json')
    cafe_hash = JSON.parse(file).first
    @cafe_name = cafe_hash["shopName"]
    @cafe_address = cafe_hash["address"]
    @cafe_phone = cafe_hash["phone"]
    @cafe_prices = cafe_hash["prices"][0]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
