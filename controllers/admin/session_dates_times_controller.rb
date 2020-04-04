require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/session.rb')
also_reload('./models/*')
