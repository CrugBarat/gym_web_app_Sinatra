require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/room.rb')
also_reload('./models/*')

#INDEX
get '/users/rooms' do
  @rooms = Room.all()
  erb(:"users/rooms/index")
end
