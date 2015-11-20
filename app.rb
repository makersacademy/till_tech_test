require 'sinatra/base'

class TillTest < Sinatra::Base
  get '/' do
    'Hello TillTest!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $TillTest
end
