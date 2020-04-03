require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')
require_relative('../models/member_details.rb')
also_reload('./models/*')

get '/instructors' do
  erb(:"instructors/home")
end

get '/instructors/members' do
  @members = Member.all()
  erb(:"instructors/members/members")
end

get '/instructors/members/create' do
  erb(:"instructors/members/create_member")
end

post '/instructors' do
  @new_member = Member.new(params)
  @new_member.save()
  erb(:"instructors/members/member_success")
end

get '/instructors/members/:id' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  erb(:"instructors/members/show_member")
end

get '/instructors/members/:id/edit' do
  id = params['id'].to_i
  @member = Member.find_by_id(id)
  @members = Member.all()
  erb(:"instructors/members/edit")
end

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
#
# get '/instructors/classes' do
#   @classes = Classes.all()
#   erb(:"instructors/classes/classes")
# end
#
# get '/instructors/classes/create' do
#   erb(:"instructors/classes/classes_create")
# end
