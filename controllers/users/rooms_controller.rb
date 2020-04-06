require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/room.rb')
also_reload('./models/*')

#INDEX
get '/users/rooms' do
  @rooms = Room.all()
  erb(:"users/rooms/index")
end

get '/users/rooms/:id/equipment' do
  id = params['id'].to_i
  room = Room.find_by_id(id)
  @equipment = room.equipment()
  erb(:"users/rooms/equipment")
end
