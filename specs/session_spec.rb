require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/session.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSession < MiniTest::Test

end
