require 'sinatra/base'

class Till < Sinatra::Base

  set :views, Proc.new {File.join(root, 'views')}
  set :public_folder, Proc.new {File.join(root, 'public')}

  till = Till.new

  get '/' do
    erb :index
  end

end
