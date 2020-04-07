require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/equipment.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestEquipment < MiniTest::Test

end
