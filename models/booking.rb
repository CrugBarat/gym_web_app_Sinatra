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
    session = sessions()
    session.title()
  end

  def show_start_time
    session = sessions()
    session.show_start_time()
  end

  def show_end_time
    session = sessions()
    session.show_end_time()
  end

  def show_date
    sessions = sessions()
    sessions.show_date()
  end

  def self.member_id_from_params(hash)
    first_name = hash["first_name"]
    last_name = hash["last_name"]
    member = Member.find_by_full_name(first_name, last_name)
    member.id
  end

  def self.user_booking(hash)
    session_id = hash["session_id"].to_i
    member_id = self.member_id_from_params(hash)
    new_hash = {}
    new_hash.merge!("member_id" => member_id)
    new_hash.merge!("session_id" => session_id)
  end

  # def self.membership_check(booking_hash)
  #   member = Member.find_by_id(booking_hash["member_id"])
  #   session = Session.find_by_id(booking_hash["session_id"])
  #   return if member.correct_membership?() == false && session.peak_time?() == true
  #   self.new(booking_hash)
  # end

  def self.map_items(result)
    result.map{|booking| Booking.new(booking)}
  end

  def self.returns_single_booking(results)
    return nil if results.first() == nil
    Booking.new(results.first())
  end

end
