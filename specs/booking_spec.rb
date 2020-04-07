require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/booking.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBooking < MiniTest::Test

end
