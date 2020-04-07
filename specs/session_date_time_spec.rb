require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/session_date_time.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSessionDateTime < MiniTest::Test

end
