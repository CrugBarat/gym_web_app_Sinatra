require('pry-byebug')
require_relative('../models/member.rb')
require_relative('../models/sessions.rb')
require_relative('../models/booking.rb')
require_relative('../models/session_date_time.rb')
require_relative('../models/instructor.rb')
require_relative('../models/room.rb')
require_relative('../models/equipment.rb')
require_relative('../models/member_details.rb')

Member.delete_all()
MemberDetails.delete_all()
Session.delete_all()
Booking.delete_all()
SessionDateTime.delete_all()
Instructor.delete_all()
Room.delete_all()
Equipment.delete_all()

##################################################################
# MEMBERS

member1 = Member.new({'first_name' => 'John',
                      'last_name' => 'Smith',
                      'date_of_birth' => '1984-10-27',
                      'active' => 1})


member1.save()


##################################################################
# MEMBERS DETAILS

member_details1 = MemberDetails.new({'address' => '123 Queen St, Glasgow',
                                       'post_code' => 'G1 1AH',
                                       'telephone_number' => 07123123123,
                                       'email_address' => 'johnsmith@gmail.com',
                                       'member_id' => member1.id})


member_details1.save()


##################################################################
# INSTRUCTORS

instructor1 = Instructor.new({'first_name' => 'Richard',
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
# EQUIPMENT

equipment1 = Equipment.new({'type' => 'Spin Bike',
                            'quantity' => 25,
                            'room_id' => room1.id})


equipment1.save()


##################################################################
# SESSIONS

session1 = Session.new({'title' => 'Spin Class',
                        'description' => 'A high-intensity group exercise class
                                         on a stationary bike, which allows you to
                                         increase or decrease pedal resistance.',
                        'instructor_id' => instructor1.id,
                        'room_id' => room1.id,
                        'active' => 1})


session1.save()


##################################################################
# SESSION_DATE_TIME

session_date_time1 = SessionDateTime.new({'start_time' => '09:00:00',
                                          'end_time' => '10:00:00',
                                          'class_date' => '2020-01-27',
                                          'session_id' => session1.id})


session_date_time1.save()


##################################################################
# BOOKINGS

booking1 = Booking.new({'member_id' => member1.id,
                        'session_id' => session1.id})


booking1.save()


##################################################################
# PRY

binding.pry
nil

##################################################################
