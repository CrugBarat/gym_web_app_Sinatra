require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')
require_relative('../models/member_details.rb')
require_relative('../models/instructor.rb')
require_relative('../models/room.rb')
require_relative('../models/classes.rb')
also_reload('./models/*')


get '/admin' do
  erb(:"admin/home")
end

################################################################
#MEMBERS

#INDEX
get '/admin/members' do
  @members = Member.all()
  @find = Member.find_by_id(params)
  erb(:"admin/members/index")
end

#NEW
get '/admin/members/create' do
  erb(:"admin/members/create")
end

#CREATE
post '/admin/members' do
  @new_member = Member.new(params)
  @new_member.save()
  erb(:"admin/members/success")
end

#SHOW
get '/admin/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"admin/members/show")
end

#EDIT
get '/admin/members/:id/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @members = Member.all()
  erb(:"admin/members/edit")
end

#UPDATE
post '/admin/members/:id' do
  member = Member.new(params)
  member.update()
  redirect('/admin/members/' + params['id'])
end

# get '/admin/members/:id/add_details' do
#   erb(:"admin/members/add_details_member")
# end
#
# post '/admin/:id' do
#   @new_member_details = MemberDetails.new(params)
#   @new_member_details.save()
#   erb(:"admin/members/add_details_success")
# end

#################################################################
#CLASSES

#INDEX
get '/admin/classes' do
  @classes = Classes.all()
  erb(:"admin/classes/index")
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
