require_relative('../db/sql_runner.rb')

class Session

  attr_reader :id
  attr_accessor :title, :description, :instructor_id, :room_id, :active, :max_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @instructor_id = options['instructor_id'].to_i
    @room_id = options['room_id'].to_i
    @active = options['active']
    @max_capacity = options['max_capacity'].to_i
  end

  def save()
    sql = "INSERT INTO sessions
    (title, description, instructor_id, room_id, active, max_capacity)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *"
    values = [@title, @description, @instructor_id, @room_id, @active, @max_capacity]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def self.all_active()
    sql = "SELECT * FROM sessions
    WHERE active"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE sessions
    SET (title, description, instructor_id, room_id, active, max_capacity)
    = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@title, @description, @instructor_id, @room_id, @active, @max_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_session(results)
  end

  def room()
    sql = "SELECT * FROM rooms
    WHERE id = $1"
    values = [@room_id]
    results = SqlRunner.run(sql, values)
    Room.returns_single_room(results)
  end

  def show_room_name()
    room = room()
    room.name
  end

  def instructor()
    sql = "SELECT * FROM Instructors
    WHERE id = $1"
    values = [@instructor_id]
    results = SqlRunner.run(sql, values)
    Instructor.returns_single_instructor(results)
  end

  def show_instructor_name()
    instructor = instructor()
    instructor.full_name
  end

  def members()
    sql = "SELECT * FROM bookings
    INNER JOIN members
    ON bookings.member_id = members.id
    WHERE bookings.session_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    Member.map_items(results)
  end

  def number_of_members()
    members().size()
  end

  def over_capacity?()
    @max_capacity <= number_of_members()
  end

  def date_time()
    sql = "SELECT * FROM session_dates_times
    INNER JOIN sessions
    ON session_dates_times.session_id = sessions.id
    WHERE sessions.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    SessionDateTime.returns_single_session_date_time(results)
  end

  def start_time()
    time = date_time()
    formatted_time = Time.parse(time.start_time())
    formatted_time.strftime("%H:%M")
  end

  def end_time()
    time = date_time()
    formatted_time = Time.parse(time.end_time())
    formatted_time.strftime("%H:%M")
  end

  def date()
    date = date_time()
    formatted_date = Date.parse(date.session_date())
    formatted_date.strftime("%d-%m-%Y")
  end

  def show_active()
    if active() == 't'
      return "ACTIVE"
    else
      return "INACTIVE"
    end
  end

  def peak_time?()
    if start_time() >= "09:00" && end_time() <= "17:00"
      return true
    else
      return false
    end
  end

  def self.map_items(result)
    result.map{|a_class| Session.new(a_class)}
  end

  def self.returns_single_session(results)
    return nil if results.first() == nil
    Session.new(results.first())
  end

end
