require 'sinatra/base'
require_relative './till.rb'

class TillTest < Sinatra::Base

  set :views, Proc.new { File.join(root, '/views') }
  enable :session
  set :session_secret, 'super secret'

  get '/' do
    erb :homepage
  end

  post '/till' do
    @menu = Menu.new
    @order = Order.new({menu: @menu})
    @name = params[:name]
    @order.cashier = @name
    session[:order] = @order
    erb :till
  end

  get '/till' do
    @order = session[:order]
    erb :till
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
