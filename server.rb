require 'sinatra/base'

class TillTest < Sinatra::Base

  set :views, Proc.new { File.join(root, '/views') }

  get '/' do
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
