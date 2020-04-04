require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/equipment_controller.rb')
require_relative('controllers/bookings_controller.rb')
require_relative('controllers/sessions_date_times_controller.rb')
require_relative('controllers/sessions_controller.rb')
require_relative('controllers/admin/admin_controller.rb')
require_relative('controllers/instructors_controller.rb')
require_relative('controllers/members_controller.rb')
require_relative('controllers/rooms_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:homepage)
end
