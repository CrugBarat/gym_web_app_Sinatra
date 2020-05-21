require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/session.rb')
require_relative('../../models/booking.rb')

#INDEX
get '/admin/bookings' do
  @bookings = Booking.all()
  erb(:"admin/bookings/index")
end

#NEW
get '/admin/sessions/:id/bookings/new' do
  id = params['id'].to_i
  @session = Session.find_by_id(id)
  @members = Member.all_active()
  erb(:"admin/bookings/book_session")
end

#CREATE
post '/admin/sessions/:id/bookings' do
  @new_booking = Booking.new(params)
  @new_booking.save()
  erb(:"admin/bookings/success")
end

#DELETE
get '/admin/bookings/:id' do
  id = params['id'].to_i
  @booking = Booking.find_by_id(id)
  erb(:"admin/bookings/delete")
end

post '/admin/bookings/:id/delete' do
  id = params['id'].to_i()
  booking = Booking.find_by_id(id)
  booking.delete()
  redirect('/admin/bookings')
end
