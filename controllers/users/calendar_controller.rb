require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/session.rb')

#INDEX
get '/users/calendar/1' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/1")
end

get '/users/calendar/2' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/2")
end

get '/users/calendar/3' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/3")
end

get '/users/calendar/4' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/4")
end

get '/users/calendar/5' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/5")
end

get '/users/calendar/6' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/6")
end

get '/users/calendar/7' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/7")
end

get '/users/calendar/8' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/8")
end

get '/users/calendar/9' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/9")
end

get '/users/calendar/10' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/10")
end

get '/users/calendar/11' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/11")
end

get '/users/calendar/12' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/12")
end

get '/users/calendar/13' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/13")
end

get '/users/calendar/14' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/14")
end

get '/users/calendar/15' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/15")
end

get '/users/calendar/16' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/16")
end

get '/users/calendar/17' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/17")
end

get '/users/calendar/18' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/18")
end

get '/users/calendar/19' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/19")
end

get '/users/calendar/20' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/20")
end

get '/users/calendar/21' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/21")
end

get '/users/calendar/22' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/22")
end

get '/users/calendar/23' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/23")
end

get '/users/calendar/24' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/24")
end

get '/users/calendar/25' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/25")
end

get '/users/calendar/26' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/26")
end

get '/users/calendar/27' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/27")
end

get '/users/calendar/28' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/28")
end

get '/users/calendar/29' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/29")
end

get '/users/calendar/30' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/30")
end

get '/users/calendar/31' do
  @sessions = Session.sort_by_date_and_time()
  erb(:"users/calendar/31")
end
