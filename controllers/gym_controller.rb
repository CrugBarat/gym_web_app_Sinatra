require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')
require_relative('../models/member_details.rb')
require_relative('../models/instructor.rb')
require_relative('../models/room.rb')
require_relative('../models/classes.rb')
also_reload('./models/*')


get '/gym' do
  erb(:"gym/home")
end

################################################################
#MEMBERS

#INDEX
get '/gym/members' do
  @members = Member.all()
  erb(:"gym/members/members")
end

#NEW
get '/gym/members/create' do
  erb(:"gym/members/create_member")
end

#CREATE
post '/gym/members' do
  @new_member = Member.new(params)
  @new_member.save()
  erb(:"gym/members/member_success")
end

#SHOW
get '/gym/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"gym/members/show_member")
end

#EDIT
get '/gym/members/:id/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @members = Member.all()
  erb(:"gym/members/edit")
end

#UPDATE
post '/gym/members/:id' do
  member = Member.new(params)
  member.update()
  redirect('/gym/members/' + params['id'])
end

# get '/gym/members/:id/add_details' do
#   erb(:"gym/members/add_details_member")
# end
#
# post '/gym/:id' do
#   @new_member_details = MemberDetails.new(params)
#   @new_member_details.save()
#   erb(:"gym/members/add_details_success")
# end

#################################################################
#CLASSES

#INDEX
get '/gym/classes' do
  @classes = Classes.all()
  erb(:"gym/classes/classes")
end

#NEW
get '/gym/classes/create' do
  @rooms = Room.all()
  @instructors = Instructor.all()
  erb(:"gym/classes/create_class")
end

#CREATE
post '/gym/classes' do
  new_class = Classes.new(params)
  new_class.save()
  erb(:"gym/classes/class_success")
end

#SHOW
get '/gym/classes/:id' do
  id = params['id'].to_i
  @found_class = Classes.find_by_id(id)
  erb(:"gym/classes/show_class")
end
