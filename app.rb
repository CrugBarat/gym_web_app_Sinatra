require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/admin/admin_controller.rb')
require_relative('controllers/admin/members_controller.rb')
require_relative('controllers/admin/members_details_controller.rb')
require_relative('controllers/admin/sessions_controller.rb')
require_relative('controllers/admin/bookings_controller.rb')
require_relative('controllers/admin/session_dates_times_controller.rb')
require_relative('controllers/admin/instructors_controller.rb')
require_relative('controllers/admin/rooms_controller.rb')
require_relative('controllers/admin/equipment_controller.rb')
require_relative('controllers/users/users_controller.rb')
require_relative('controllers/users/members_controller.rb')
require_relative('controllers/users/members_details_controller.rb')
require_relative('controllers/users/sessions_controller.rb')
require_relative('controllers/users/bookings_controller.rb')
require_relative('controllers/users/instructors_controller.rb')
require_relative('controllers/users/rooms_controller.rb')
require_relative('controllers/users/calendar_controller.rb')


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
