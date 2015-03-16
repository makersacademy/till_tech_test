require 'sinatra/base'
require_relative 'lib/till.rb'

class TillApp < Sinatra::Base

  set :views, Proc.new {File.join(root, 'views')}
  set :public_folder, Proc.new {File.join(root, 'public')}

  till = Till.new

  get '/' do
    @items = till.price_list
    @receipt = till.generate_receipt
    erb :index
  end

  post '/add_item' do
    till.add_item params[:item], params[:quantity].to_f
    redirect '/'
  end

end
