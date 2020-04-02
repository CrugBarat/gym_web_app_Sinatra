require('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/class.rb')
require_relative('../models/booking.rb')
require_relative('../models/classes_date_time.rb')
require_relative('../models/instructor.rb')
require_relative('../models/room.rb')

# Member.delete_all()
# Class.delete_all()
# Booking.delete_all()
# ClassesDateTime.delete_all()
# Instructor.delete_all()
# Room.delete_all()

##################################################################
# MEMBERS

member1 = Member.new({'first_name' => 'John',
                      'last_name' => 'Smith',
                      'address' => '123 Queen St, Glasgow',
                      'post_code' => 'G1 1AH',
                      'telephone_number' => 07123123123,
                      'email_address' => 'johnsmith@gmail.com',
                      'date_of_birth' => '1984-10-27',
                      'active' => 1})


member1.save()



##################################################################
# INSTRUCTORS

instructor1 = Member.new({'first_name' => 'Richard',
                          'last_name' => 'Jonson',
                          'profile' => 'Coming from a Rugby background,
                                        Richard has developed a career in strength
                                        & conditioning training with functional training',
                          'email_address' => 'r_jonson@gym.com'})


instructor1.save()


##################################################################
# ROOMS

room1 = Room.new({'name' => 'Spin Studio'})


room1.save()


##################################################################
# AMENITIES

amenity1 = Amenity.new({'type' => 'Spin Bike',
                        'quantity' => 25,
                        'room_id' => room1.id})


instructor1.save()


##################################################################

# PRY

binding.pry
nil

##################################################################
