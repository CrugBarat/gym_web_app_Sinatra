require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/session.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSession < MiniTest::Test

  def setup()
    @session1 = Session.new({'title' => 'Flying Practice',
                            'description' => 'Insert Description.',
                            'instructor_id' => 45,
                            'room_id' => 3,
                            'active' => 't',
                            'max_capacity' => 5})

    @session2 = Session.new({'title' => 'Punching Practice',
                            'description' => 'Insert Description.',
                            'instructor_id' => 12,
                            'room_id' => 34,
                            'active' => 'f',
                            'max_capacity' => 5})
  end

  def test_show_active()
    assert_equal('ACTIVE', @session1.show_active())
  end

  def test_show_active__INACTIVE()
    assert_equal('INACTIVE', @session2.show_active())
  end

end
