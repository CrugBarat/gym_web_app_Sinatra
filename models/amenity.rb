require_relative('../db/sql_runner.rb')

class Amenity

  attr_reader :id
  attr_accessor :type, :quantity, :room_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @quantity = options['quantity']
    @room_id = options['room_id'].to_i
  end

  def save()
      sql = "INSERT INTO amenities
             (type, quantity, room_id)
             VALUES ($1, $2, $3)
             RETURNING *"
      values = [@type, @quantity, @room_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM amenities"
      result = SqlRunner.run(sql)
      self.map_items(result)
    end

    def update()
      sql = "UPDATE amenities
             SET (type, quantity, room_id)
             = ($1, $2, $3)
             WHERE id = $4"
      values = [@type, @quantity, @room_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM amenities
             WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM amenities"
      SqlRunner.run(sql)
    end

    def self.map_items(result)
    result.map{|amenity| Amenity.new(amenity)}
  end

  def self.returns_single_amenity(results)
    return nil if results.first() == nil
    Amenity.new(results.first())
  end

end
