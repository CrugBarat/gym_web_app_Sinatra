require_relative('../db/sql_runner.rb')

class Instructor

  attr_reader :id
  attr_accessor :first_name, :last_name, :profile, :email_address

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @profile = options['profile']
    @email_address = options['email_address']
  end

  def save()
    sql = "INSERT INTO instructors
    (first_name, last_name, profile, email_address)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@first_name, @last_name, @profile, @email_address]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM instructors"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE instructors
    SET (first_name, last_name, profile, email_address)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@first_name, @last_name, @profile, @email_address, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM instructors
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM instructors"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM instructors
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_instructor(results)
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def sessions()
    sql = "SELECT * FROM sessions
           WHERE instructor_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    Session.map_items(results)
  end

  def self.map_items(result)
    result.map{|instructor| Instructor.new(instructor)}
  end

  def self.returns_single_instructor(results)
    return nil if results.first() == nil
    Instructor.new(results.first())
  end

end
