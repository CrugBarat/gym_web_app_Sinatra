require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
require_relative('../../models/room.rb')
require_relative('../../models/session.rb')
also_reload('./models/*')

#INDEX
get '/users/sessions' do
  @sessions = Session.all()
  erb(:"users/sessions/index")
end
