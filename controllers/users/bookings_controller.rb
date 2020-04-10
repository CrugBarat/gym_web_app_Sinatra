require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/session.rb')
require_relative('../../models/booking.rb')
also_reload('./models/*')

#NEW
get '/users/bookings/new' do
  erb(:"users/bookings/new")
end

post '/users/bookings/new/book' do
  first_name = params["first_name"]
  last_name = params["last_name"]
  @member = Member.find_by_full_name(first_name, last_name)
  @sessions = Session.all_active()
  erb(:"users/bookings/book")
end

#CREATE
post '/users/bookings' do
  @new_booking = Booking.new(params)
  @new_booking.save()
  erb(:"users/bookings/success")
end

get '/users/bookings/error' do
  erb(:"users/errors/no_member")
end
