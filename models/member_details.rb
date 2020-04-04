require_relative('../db/sql_runner.rb')

class MemberDetails

  attr_reader :id
  attr_accessor :address, :post_code, :telephone_number, :email_address, :member_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @post_code = options['post_code']
    @telephone_number = options['telephone_number'].to_i
    @email_address = options['email_address']
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO member_details
    (address, post_code, telephone_number, email_address, member_id)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *"
    values = [@address, @post_code, @telephone_number, @email_address, @member_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM member_details"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE member_details
    SET (address, post_code, telephone_number, email_address, member_id)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@address, @post_code, @telephone_number, @email_address, @member_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM member_details
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM member_details"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM member_details
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_member_details(results)
  end

  def self.find_by_member_id(id)
    sql = "SELECT * FROM member_details
           WHERE member_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_member_details(results)
  end

  def self.find_by_member_id(id)
    sql = "SELECT * FROM member_details
           WHERE member_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_member_details(results)
  end

  def self.map_items(result)
    result.map{|member_detail| MemberDetails.new(member_detail)}
  end

  def self.returns_single_member_details(results)
    return nil if results.first() == nil
    MemberDetails.new(results.first())
  end

end
