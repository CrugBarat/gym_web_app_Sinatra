require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/equipment.rb')
require_relative('../../models/room.rb')
also_reload('./models/*')

#INDEX
get '/admin/equipment' do
  @equipment = Equipment.all()
  erb(:"admin/equipment/index")
end

#NEW
get '/admin/equipment/create' do
  @rooms = Room.all()
  erb(:"admin/equipment/create")
end

#CREATE
post '/admin/equipment' do
  @new_equipment = Equipment.new(params)
  @new_equipment.save()
  erb(:"admin/equipment/success")
end

#SHOW
get '/admin/equipment/:id' do
  id = params['id'].to_i
  @found_equipment = Equipment.find_by_id(id)
  erb(:"admin/equipment/show")
end

#EDIT
get '/admin/equipment/:id/edit' do
  id = params['id'].to_i
  @found_equipment = Equipment.find_by_id(id)
  @rooms = Room.all()
  erb(:"admin/equipment/edit")
end

#UPDATE
post '/admin/equipment/:id' do
  id = params['id']
  equipment = Equipment.new(params)
  equipment.update()
  redirect('/admin/equipment/' + id )
end
