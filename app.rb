require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/admin/admin_controller.rb')
require_relative('controllers/users/users_controller.rb')

set :raise_errors, false
set :show_exceptions, false

  get '/' do
    erb(:homepage)
  end

  error 500 do
    redirect to('/users/bookings/error')
  end

  error 404 do
    redirect to('/admin/error/not_found')
  end
