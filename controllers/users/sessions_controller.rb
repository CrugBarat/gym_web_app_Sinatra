require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
require_relative('../../models/room.rb')
require_relative('../../models/session.rb')

#INDEX
get '/users/sessions' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/sessions/index")
end
