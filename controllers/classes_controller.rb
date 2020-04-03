require('sinatra')
require('sinatra/contrib/all') if development?

get '/classes' do
  erb(:"classes/home")
end
