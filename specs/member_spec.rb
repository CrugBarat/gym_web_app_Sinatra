require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/member.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestMember < MiniTest::Test

  def setup()
    @member1 = Member.new({'first_name' => 'Chad',
                          'last_name' => 'Hogan',
                          'date_of_birth' => '1982-11-24',
                          'membership_type' => 'PREMIUM',
                          'active' => 't'})

    @member2 = Member.new({'first_name' => 'Diana',
                          'last_name' => 'Smith',
                          'date_of_birth' => '1988-05-13',
                          'membership_type' => 'STANDARD',
                          'active' => 't'})
  end

  def test_show_active()
    assert_equal('ACTIVE', @member1.show_active())
  end

  def test_correct_membership__true()
    assert_equal(true, @member1.correct_membership?())
  end

  def test_correct_membership__false()
    assert_equal(false, @member2.correct_membership?())
  end

  def test_formatted_dob()
    assert_equal('24-11-1982', @member1.formatted_dob())
  end

end
