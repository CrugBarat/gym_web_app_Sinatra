require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/member_details.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestMemberDetails < MiniTest::Test

end
