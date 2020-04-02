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

end
