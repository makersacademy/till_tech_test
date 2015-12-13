require 'sinatra/base'
require 'tilt/erb'
require_relative '../data_mapper_setup'
# require 'sinatra/flash'
require_relative '../lib/menu.rb'


class Apps < Sinatra::Base
enable :sessions
set :views, proc { File.join(root, 'views') }

get '/' do
  "Hello World"
  redirect to('/menu')
end

 get '/menu' do
  m=Menu.new
  @lists = m.showmenulist
  @time = m.current_time
  erb :menu

end

post '/menu' do
  Database.create(item: params[:item], quantity: params[:quantity])
  redirect to('/menu')
end

get '/new_menu' do
    @m=Menu.new
    @datas = Database.all
    @datas.each do |data|
    @name = data.item.to_s
    @quant = data.quantity.to_i
    @m.order(@name, @quant)
  end
    @price_order=@m.prices
    @sum_order=@m.sum
    @taxes_order=@m.taxes
    @discount_order=@m.discount
    @totals=@m.total_bill_show
    @totals.each do | total |
    puts @total
    @total
    end
  erb :new_menu
end


post '/new_menu' do
  payit=params[:payit]
  @payit=payit.to_f
  if @payit > @sum_order.to_f
   redirect to('/not_enough')
  else
   session[:payit] = @payit
   redirect to('/finish')
end
end

 get '/not_enough' do
   erb :not_enough
end

 get '/finish' do
   erb :finish
 end











  # start the server if ruby file executed directly
  run! if app_file == $0

end
