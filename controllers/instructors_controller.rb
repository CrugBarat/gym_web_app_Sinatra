require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/member.rb')

get '/instructors' do
  erb(:"instructors/home")
end

get '/instructors/members' do
  @members = Member.all()
  erb(:"instructors/members")
end

get '/instructors/classes' do
  @classes = Classes.all()
  erb(:"instructors/classes")
end

get '/instructors/members/create' do
  erb(:"instructors/members_create")
end
