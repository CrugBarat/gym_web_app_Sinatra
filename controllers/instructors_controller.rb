require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')
require_relative('../models/member_details.rb')
require_relative('../models/instructor.rb')
require_relative('../models/room.rb')
require_relative('../models/classes.rb')
also_reload('./models/*')


get '/instructors' do
  erb(:"instructors/home")
end

################################################################
#MEMBERS

#INDEX
get '/instructors/members' do
  @members = Member.all()
  erb(:"instructors/members/members")
end

#NEW
get '/instructors/members/create' do
  erb(:"instructors/members/create_member")
end

#CREATE
post '/instructors/members' do
  @new_member = Member.new(params)
  @new_member.save()
  erb(:"instructors/members/member_success")
end

#SHOW
get '/instructors/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"instructors/members/show_member")
end

#EDIT
get '/instructors/members/:id/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @members = Member.all()
  erb(:"instructors/members/edit")
end

#UPDATE
post '/instructors/members/:id' do
  member = Member.new(params)
  member.update()
  redirect('/instructors/members/' + params['id'])
end

# get '/instructors/members/:id/add_details' do
#   erb(:"instructors/members/add_details_member")
# end
#
# post '/instructors/:id' do
#   @new_member_details = MemberDetails.new(params)
#   @new_member_details.save()
#   erb(:"instructors/members/add_details_success")
# end

#################################################################
#CLASSES

#INDEX
get '/instructors/classes' do
  @classes = Classes.all()
  erb(:"instructors/classes/classes")
end

#NEW
get '/instructors/classes/create' do
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"instructors/classes/create_class")
end

#CREATE
post '/instructors/classes' do
  new_class = Classes.new(params)
  new_class.save()
  erb(:"instructors/classes/class_success")
end

#SHOW
get '/instructors/classes/:id' do
  id = params['id'].to_i
  @found_class = Classes.find_by_id(id)
  erb(:"instructors/classes/show_class")
end
