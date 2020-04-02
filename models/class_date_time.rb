require_relative('../db/sql_runner.rb')

class ClassDateTime

  attr_reader :id
  attr_accessor :start_time, :end_time, :class_date, :class_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @class_date = options['class_date']
    @class_id = options['class_id'].to_i
  end

end
