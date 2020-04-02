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

end
