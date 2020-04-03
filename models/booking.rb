require_relative('../db/sql_runner.rb')

class Booking

  attr_reader :id
  attr_accessor :member_id, :class_id,

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @class_id = options['class_id'].to_i
  end

  def save()
      sql = "INSERT INTO bookings
             (member_id, class_id)
             VALUES ($1, $2)
             RETURNING *"
      values = [@member_id, @class_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM bookings"
      result = SqlRunner.run(sql)
      self.map_items(result)
    end

    def update()
      sql = "UPDATE bookings
             SET (member_id, class_id)
             = ($1, $2)
             WHERE id = $3"
      values = [@member_id, @class_id, @id]
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

    def self.map_items(result)
    result.map{|booking| Booking.new(booking)}
  end

  def self.returns_single_amenity(results)
    return nil if results.first() == nil
    Booking.new(results.first())
  end

end
