require_relative('../db/sql_runner.rb')

class Booking

  attr_reader :id
  attr_accessor :member_id, :session_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (member_id, session_id)
    VALUES ($1, $2)
    RETURNING *"
    values = [@member_id, @session_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE bookings
    SET (member_id, session_id)
    = ($1, $2)
    WHERE id = $3"
    values = [@member_id, @session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM bookings
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_booking(results)
  end

  def self.find_by_member_id(id)
    sql = "SELECT * FROM bookings
           WHERE member_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_booking(results)
  end

  def member()
    sql = "SELECT * FROM members
           WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    Member.returns_single_member(results)
  end

  def show_member_name
    member = member()
    member.full_name
  end

  def sessions()
    sql = "SELECT * FROM sessions
           WHERE id = $1"
    values = [@session_id]
    results = SqlRunner.run(sql, values)
    Session.returns_single_session(results)
  end

  def show_session_title
    sessions = sessions()
    sessions.title
  end

  def self.membership_check(params)
    member = Member.find_by_id(params[:member_id])
    session = Session.find_by_id(params[:session_id])
    return if member.correct_membership?() == false && session.peak_time?() == true
    Booking.new(params)
  end

  def self.map_items(result)
    result.map{|booking| Booking.new(booking)}
  end

  def self.returns_single_booking(results)
    return nil if results.first() == nil
    Booking.new(results.first())
  end

end
