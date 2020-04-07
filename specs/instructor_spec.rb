require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/instructor.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestInstructor < MiniTest::Test

end
