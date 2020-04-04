require_relative('../db/sql_runner.rb')

class SessionDateTime

  attr_reader :id
  attr_accessor :start_time, :end_time, :session_date, :session_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @session_date = options['session_date']
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO session_dates_times
    (start_time, end_time, session_date, session_id)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@start_time, @end_time, @session_date, @session_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM session_dates_times"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE session_dates_times
    SET (start_time, end_time, session_date, session_id)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@start_time, @end_time, @session_date, @session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM session_dates_times
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM session_dates_times"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM session_dates_times
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_session_date_time(results)
  end

  def self.find_by_session_id(id)
    sql = "SELECT * FROM session_dates_times
           WHERE session_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_session_date_time(results)
  end


  def self.map_items(result)
    result.map{|session_date_time| SessionDateTime.new(session_date_time)}
  end

  def self.returns_single_session_date_time(results)
    return nil if results.first() == nil
    SessionDateTime.new(results.first())
  end

end
