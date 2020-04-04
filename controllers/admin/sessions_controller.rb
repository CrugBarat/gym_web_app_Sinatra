require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
require_relative('../../models/room.rb')
require_relative('../../models/session.rb')
also_reload('./models/*')

#INDEX
get '/admin/sessions' do
  @sessions = Session.all()
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
  @sessions = Session.all()
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"admin/sessions/edit")
end

#UPDATE
post '/admin/sessions/:id' do
  member = Session.new(params)
  member.update()
  redirect('/admin/sessions/' + params['id'])
end
