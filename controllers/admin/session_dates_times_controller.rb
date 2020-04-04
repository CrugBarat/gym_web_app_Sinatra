require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/session.rb')
require_relative('../../models/session_date_time.rb')
also_reload('./models/*')

#NEW
get '/admin/sessions/:id/date_time/create' do
  id = params['id'].to_i
  @session = Session.find_by_id(id)
  erb(:"admin/session_dates_times/create")
end

#CREATE
post '/admin/sessions/:id/date_time' do
  id = params['id'].to_i
  new_params = params.merge!(session_id: id)
  session_date_time = SessionDateTime.new(new_params)
  session_date_time.save()
  redirect('/admin/sessions')
end
