require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :address, :post_code, :telephone_number, :email_address, :date_of_birth, :active

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @post_code = options['post_code']
    @telephone_number = options['telephone_number'].to_i
    @email_address = options['email_address']
    @date_of_birth = options['date_of_birth']
    @active = options['active']
  end

end
