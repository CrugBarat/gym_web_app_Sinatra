require('sinatra')
require('sinatra/contrib/all') if development?

get '/members' do
  erb(:"members/home")
end
