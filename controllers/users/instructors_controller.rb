require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/instructor.rb')
also_reload('./models/*')

#INDEX
get '/users/instructors' do
  @instructors = Instructor.all()
  erb(:"users/instructors/index")
end

get '/users/instructors/:id/sessions' do
  id = params['id'].to_i
  instructor = Instructor.find_by_id(id)
  @sessions = instructor.sessions()
  erb(:"users/instructors/sessions")
end
