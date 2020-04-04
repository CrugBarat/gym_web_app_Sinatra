require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/session.rb')

get '/sessions' do
  @sessions = Session.all()
  erb(:"sessions/home")
end
