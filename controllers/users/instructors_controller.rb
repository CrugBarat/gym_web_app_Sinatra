require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
also_reload('./models/*')

#INDEX
get '/users/instructors' do
  @instructors = Instructor.all()
  erb(:"users/instructors/index")
end
