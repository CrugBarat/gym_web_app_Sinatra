require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/classes.rb')

get '/classes' do
  @classes = Classes.all()
  erb(:"classes/home")
end
