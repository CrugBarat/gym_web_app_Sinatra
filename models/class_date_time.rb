require_relative('../db/sql_runner.rb')

class ClassDateTime

  attr_reader :id
  attr_accessor :start_time, :end_time, :class_date, :class_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @class_date = options['class_date']
    @class_id = options['class_id'].to_i
  end

  def save()
    sql = "INSERT INTO class_date_times
    (start_time, end_time, class_date, class_id)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@start_time, @end_time, @class_date, @class_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM class_date_times"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE class_date_times
    SET (start_time, end_time, class_date, class_id)
    = ($1, $2, £3, $4)
    WHERE id = $5"
    values = [@start_time, @end_time, @class_date, @class_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM class_date_times
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM class_date_times"
    SqlRunner.run(sql)
  end

  def self.map_items(result)
    result.map{|class_date_time| ClassDateTime.new(class_date_time)}
  end

  def self.returns_single_class_date_time(results)
    return nil if results.first() == nil
    ClassDateTime.new(results.first())
  end

end
