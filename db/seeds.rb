require_relative('../models/member.rb')
require_relative('../models/session.rb')
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
                      'membership_type' => 'PREMIUM',
                      'active' => 1})


member1.save()


##################################################################
# MEMBERS DETAILS

member_details1 = MemberDetails.new({'address' => '123 Queen St, Glasgow',
                                       'post_code' => 'G1 1AH',
                                       'telephone_number' => 7773826653,
                                       'email_address' => 'johnsmith@gmail.com',
                                       'member_id' => member1.id})


member_details1.save()


##################################################################
# INSTRUCTORS

instructor1 = Instructor.new({'first_name' => 'Richard',
                              'last_name' => 'Jonson',
                              'profile' => 'Fitness instructor for 15 years',
                              'email_address' => 'r_jonson@gym.com'})


instructor1.save()


##################################################################
# ROOMS

room1 = Room.new({'name' => 'Spin Studio',
                  'image' => '/images/rooms/room1.webp'})

room2 = Room.new({'name' => 'Free Weights',
                  'image' => '/images/rooms/room2.webp'})

room3 = Room.new({'name' => 'Cardio Room',
                  'image' => '/images/rooms/room3.webp'})

room4 = Room.new({'name' => 'Health Suite',
                  'image' => '/images/rooms/room5.webp'})

room5 = Room.new({'name' => 'Chill-out Area',
                  'image' => '/images/rooms/room4.webp'})


room1.save()
room2.save()
room3.save()
room4.save()
room5.save()


##################################################################
# EQUIPMENT

equipment1 = Equipment.new({'type' => 'Spin Bike',
                            'quantity' => 25,
                            'room_id' => room1.id})


equipment1.save()


##################################################################
# SESSIONS

session1 = Session.new({'title' => 'Spin Class',
                        'description' => 'A high-intensity group exercise class on a stationary bike, which allows you to increase or decrease pedal resistance.',
                        'instructor_id' => instructor1.id,
                        'room_id' => room1.id,
                        'active' => 1,
                        'max_capacity' => 25})

session2 = Session.new({'title' => 'One2One',
                        'description' => 'A one to one training session with your personal fitness instructor.',
                        'instructor_id' => instructor1.id,
                        'room_id' => room2.id,
                        'active' => 1,
                        'max_capacity' => 1})


session1.save()
session2.save()


##################################################################
# SESSION_DATE_TIME

session_date_time1 = SessionDateTime.new({'start_time' => '09:00:00',
                                          'end_time' => '10:00:00',
                                          'session_date' => '2020-04-01',
                                          'session_id' => session1.id})

session_date_time2 = SessionDateTime.new({'start_time' => '18:00:00',
                                          'end_time' => '18:45:00',
                                          'session_date' => '2020-04-02',
                                          'session_id' => session2.id})


session_date_time1.save()
session_date_time2.save()


##################################################################
# BOOKINGS

booking1 = Booking.new({'member_id' => member1.id,
                        'session_id' => session1.id})

booking2 = Booking.new({'member_id' => member1.id,
                        'session_id' => session2.id})


booking1.save()
booking2.save()
