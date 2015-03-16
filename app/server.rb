require 'sinatra/base'
require_relative 'lib/till.rb'

class TillApp < Sinatra::Base

  set :views, Proc.new {File.join(root, 'views')}
  set :public_folder, Proc.new {File.join(root, 'public')}

  till = Till.new

  get '/' do
    @items = till.price_list
    erb :index
  end

  get '/add_item/:item' do
    till.add_item params[:item]
    redirect '/'
  end

end
