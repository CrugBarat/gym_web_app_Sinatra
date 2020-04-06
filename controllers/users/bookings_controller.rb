require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/session.rb')
require_relative('../../models/booking.rb')
also_reload('./models/*')

#NEW
get '/users/bookings/new' do
  @members = Member.all_active()
  @sessions = Session.all_active()
  erb(:"users/bookings/book")
end

#CREATE
post '/users/bookings' do
  @new_booking = Booking.membership_check(params)
  @new_booking.save()
  erb(:"users/bookings/success")
end

get '/users/bookings/error' do
  erb(:"users/bookings/error")
end
