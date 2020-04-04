require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
require_relative('../../models/room.rb')
require_relative('../../models/classes.rb')
also_reload('./models/*')


#INDEX
get '/admin/classes' do
  @classes = Classes.all()
  erb(:"admin/classes/index")
end

get '/admin/classes/:id/bookings' do
  id = params['id'].to_i
  found_class = Classes.find_by_id(id)
  @members = found_class.members()
  erb(:"admin/classes/bookings")
end

#NEW
get '/admin/classes/create' do
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"admin/classes/create")
end

#CREATE
post '/admin/classes' do
  @new_class = Classes.new(params)
  @new_class.save()
  erb(:"admin/classes/success")
end

#SHOW
get '/admin/classes/:id' do
  id = params['id'].to_i
  @found_class = Classes.find_by_id(id)
  erb(:"admin/classes/show")
end

#EDIT
get '/admin/classes/:id/edit' do
  id = params['id'].to_i
  @class = Classes.find_by_id(id)
  @classes = Classes.all()
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"admin/classes/edit")
end

#UPDATE
post '/admin/classes/:id' do
  member = Classes.new(params)
  member.update()
  redirect('/admin/classes/' + params['id'])
end
