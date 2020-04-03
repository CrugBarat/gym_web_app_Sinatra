require('sinatra')
require('sinatra/contrib/all') if development?

get '/instructors' do
  erb(:"instructors/home")
end
