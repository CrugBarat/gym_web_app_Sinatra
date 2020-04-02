require_relative('../db/sql_runner.rb')

class MembersDetails

  attr_reader :id
  attr_accessor :address, :post_code, :telephone_number, :email_address, :member_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @post_code = options['post_code']
    @telephone_number = options['telephone_number'].to_i
    @email_address = options['email_address']
    @member_id = options['member_id']
  end

end
