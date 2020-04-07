require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/member.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestMember < MiniTest::Test

end
