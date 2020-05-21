require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/room.rb')

#INDEX
get '/admin/rooms' do
  @rooms = Room.all()
  erb(:"admin/rooms/index")
end

get '/admin/rooms/:id/equipment' do
  id = params['id'].to_i
  room = Room.find_by_id(id)
  @equipment = room.equipment()
  erb(:"admin/rooms/equipment")
end

#NEW
get '/admin/rooms/create' do
  erb(:"admin/rooms/create")
end

#CREATE
post '/admin/rooms' do
  @new_room = Room.new(params)
  @new_room.save()
  erb(:"admin/rooms/success")
end

#SHOW
get '/admin/rooms/:id' do
  id = params['id'].to_i
  @room = Room.find_by_id(id)
  erb(:"admin/rooms/show")
end

#EDIT
get '/admin/rooms/:id/edit' do
  id = params['id'].to_i
  @room = Room.find_by_id(id)
  erb(:"admin/rooms/edit")
end

#UPDATE
post '/admin/rooms/:id' do
  id = params['id']
  room = Room.new(params)
  room.update()
  redirect('/admin/rooms/' + id )
end
