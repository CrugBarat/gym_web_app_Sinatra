require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')
also_reload('./models/*')

get '/instructors' do
  erb(:"instructors/home")
end

get '/instructors/members' do
  @members = Member.all()
  erb(:"instructors/members")
end

get '/instructors/members/create' do
  erb(:"instructors/create_member")
end

post '/instructors' do
  @new_member = Member.new(params)
  new_member.save()
  erb(:"instructors/member_success")
end

get '/instructors/members/add_details' do
  erb(:"instructors/add_details_member")
end

get '/instructors/classes' do
  @classes = Classes.all()
  erb(:"instructors/classes")
end

get '/instructors/classes/create' do
  erb(:"instructors/classes_create")
end
