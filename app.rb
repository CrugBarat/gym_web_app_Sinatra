require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/admin/admin_controller.rb')
require_relative('controllers/users/users_controller.rb')
require_relative('./members_controller.rb')
require_relative('./members_details_controller.rb')
require_relative('./sessions_controller.rb')
require_relative('./bookings_controller.rb')
require_relative('./session_dates_times_controller.rb')
require_relative('./instructors_controller.rb')
require_relative('./rooms_controller.rb')
require_relative('./equipment_controller.rb')
require_relative('./members_controller.rb')
require_relative('./members_details_controller.rb')
require_relative('./sessions_controller.rb')
require_relative('./bookings_controller.rb')
require_relative('./instructors_controller.rb')
require_relative('./rooms_controller.rb')
require_relative('./calendar_controller.rb')

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
