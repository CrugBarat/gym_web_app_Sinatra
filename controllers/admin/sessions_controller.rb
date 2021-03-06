require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
require_relative('../../models/room.rb')
require_relative('../../models/session.rb')

#INDEX
get '/admin/sessions' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"admin/sessions/index")
end

get '/admin/sessions/:id/bookings' do
  id = params['id'].to_i
  session = Session.find_by_id(id)
  @members = session.members()
  erb(:"admin/sessions/bookings")
end

#NEW
get '/admin/sessions/create' do
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"admin/sessions/create")
end

#CREATE
post '/admin/sessions' do
  @new_session = Session.new(params)
  @new_session.save()
  redirect('/admin/sessions/' + @new_session.id.to_s + '/date_time/create')
end

#SHOW
get '/admin/sessions/:id' do
  id = params['id'].to_i
  @session = Session.find_by_id(id)
  erb(:"admin/sessions/show")
end

#EDIT
get '/admin/sessions/:id/edit' do
  id = params['id'].to_i
  @session = Session.find_by_id(id)
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"admin/sessions/edit")
end

#UPDATE
post '/admin/sessions/:id' do
  session = Session.new(params)
  session.update()
  redirect('/admin/sessions/' + session.id.to_s + '/date_time/edit')
end
