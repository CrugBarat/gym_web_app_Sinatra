require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/admin/admin_controller.rb')
require_relative('controllers/users/users_controller.rb')
also_reload('./models/*')

set :raise_errors, false
set :show_exceptions, false

get '/' do
  erb(:homepage)
end

get '/error' do
  return 'ERROR! Please try again!'
end

get '/not-found' do
  return 'Oops! Page not found!'
end

get '/raise500' do
  raise 500
end

get '/divide-by-zero' do
  x = 5/0
end

error do
  redirect to('/admin/bookings/error')
end

error 404 do
  redirect to('/not-found')
end

error ZeroDivisionError do
  redirect to('/error')
end
