require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../../models/member.rb')
require_relative('../../models/session.rb')
require_relative('../../models/booking.rb')
also_reload('./models/*')


#INDEX
get '/admin/bookings' do
  @bookings = Booking.all()
  erb(:"admin/bookings/index")
end

#NEW
get '/admin/bookings/new' do
  @members = Member.all()
  @sessions = Session.all()
  erb(:"admin/bookings/book")
end

#CREATE
post '/admin/bookings' do
  @new_booking = Booking.new(params)
  @new_booking.save
  erb(:"admin/bookings/success")
end

#SHOW
get '/admin/bookings/:id' do
  id = params['id'].to_i
  @booking = Booking.find_by_id(id)
  erb(:"admin/bookings/show")
end

#EDIT
get '/admin/bookings/:id/edit' do
  id = params['id'].to_i
  @booking = Booking.find_by_id(id)
  @members = Member.all()
  @sessions = Session.all()
  erb(:"admin/bookings/edit")
end

#UPDATE
post '/admin/bookings/:id' do
  booking = Booking.new(params)
  booking.update()
  redirect('/admin/bookings/' + params['id'])
end
