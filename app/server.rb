require 'sinatra/base'

class Till < Sinatra::Base

  get '/' do
    'Hello World!'
  end

end
