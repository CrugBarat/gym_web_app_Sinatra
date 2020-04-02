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

end
