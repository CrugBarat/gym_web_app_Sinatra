require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/amenities_controller.rb')
require_relative('controllers/bookings_controller.rb')
require_relative('controllers/class_date_times_controller.rb')
require_relative('controllers/classes_controller.rb')
require_relative('controllers/instructors_controller.rb')
require_relative('controllers/instructors_controller.rb')
require_relative('controllers/members_controller.rb')
require_relative('controllers/rooms_controller.rb')

get '/' do
  erb(:homepage)
end
