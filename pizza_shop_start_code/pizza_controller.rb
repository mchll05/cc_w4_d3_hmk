require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')

#index
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new (must put before show)
# show the new pizza FORM
get '/pizza_orders/new' do
  erb(:new)
end

#show
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

#show the edit FORM
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#create
# process te "new pizza" FORM and redirect to the List
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#delete
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect '/pizza_orders'
end

#update, process the edit
post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect '/pizza_orders'
end
