require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./members_controller.rb')
require_relative('./members_details_controller.rb')
require_relative('./sessions_controller.rb')
require_relative('./bookings_controller.rb')
require_relative('./session_dates_times_controller.rb')
require_relative('./instructors_controller.rb')
require_relative('./rooms_controller.rb')
require_relative('./equipment_controller.rb')

get '/admin' do
  erb(:"admin/home")
end

get '/admin/error/not_found' do
  erb(:"admin/errors/not_found")
end
