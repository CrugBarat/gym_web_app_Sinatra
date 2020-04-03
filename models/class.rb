require_relative('../db/sql_runner.rb')

class Class

  attr_reader :id
  attr_accessor :title, :description, :instructor_id, :room_id, :active

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @instructor_id = options['instructor_id'].to_i
    @room_id = options['room_id'].to_i
    @active = options['active']
  end

  def save()
    sql = "INSERT INTO classes
    (title, description, instructor_id, room_id, active)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *"
    values = [@title, @description, @instructor_id, @room_id, @active]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM classes"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE classes
    SET (title, description, instructor_id, room_id, active)
    = ($1, $2, £3, $4, $5)
    WHERE id = $6"
    values = [@title, @description, @instructor_id, @room_id, @active, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM classes
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM classes"
    SqlRunner.run(sql)
  end

  def self.map_items(result)
    result.map{|a_class| Class.new(a_class)}
  end

  def self.returns_single_class(results)
    return nil if results.first() == nil
    Class.new(results.first())
  end

end
