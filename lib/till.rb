require 'sinatra/base'
require 'json'

class Till < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    'Hello Till!'
    file = File.read('hipstercoffee.json')
    @cafe_hash = JSON.parse(file)
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
