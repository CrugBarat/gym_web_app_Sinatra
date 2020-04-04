require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./members_controller.rb')
require_relative('./classes_controller.rb')
require_relative('./bookings_controller.rb')
also_reload('./models/*')


get '/admin' do
  erb(:"admin/home")
end
