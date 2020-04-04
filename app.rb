require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/admin/admin_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:homepage)
end
