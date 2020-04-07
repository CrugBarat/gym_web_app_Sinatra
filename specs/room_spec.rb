require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/room.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test

end
