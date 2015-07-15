require 'sinatra/base'

class Till < Sinatra::Base
  get '/' do
    'Hello Till!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
