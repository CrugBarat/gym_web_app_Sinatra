require_relative('../db/sql_runner.rb')

class Equipment

  attr_reader :id
  attr_accessor :type, :quantity, :room_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @quantity = options['quantity']
    @room_id = options['room_id'].to_i
  end

  def save()
    sql = "INSERT INTO equipment
    (type, quantity, room_id)
    VALUES ($1, $2, $3)
    RETURNING *"
    values = [@type, @quantity, @room_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM equipment"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE equipment
    SET (type, quantity, room_id)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@type, @quantity, @room_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM equipment
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM equipment"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM equipment
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_equipment(results)
  end

  def self.map_items(result)
    result.map{|equipment| Equipment.new(equipment)}
  end

  def self.returns_single_equipment(results)
    return nil if results.first() == nil
    Equipment.new(results.first())
  end

end
