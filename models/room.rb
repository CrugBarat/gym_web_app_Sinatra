require_relative('../db/sql_runner.rb')

class Room

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO rooms
    (name)
    VALUES ($1)
    RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rooms"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE rooms
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rooms
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM rooms"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM rooms
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_room(results)
  end

  def self.map_items(result)
    result.map{|room| Room.new(room)}
  end

  def self.returns_single_room(results)
    return nil if results.first() == nil
    Room.new(results.first())
  end

end
