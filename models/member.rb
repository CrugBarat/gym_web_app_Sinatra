require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :date_of_birth, :membership_type, :active

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth']
    @membership_type = options['membership_type']
    @active = options['active']
  end

  def save()
    sql = "INSERT INTO members
           (first_name, last_name, date_of_birth, membership_type, active)
           VALUES ($1, $2, $3, $4, $5)
           RETURNING *"
    values = [@first_name, @last_name, @date_of_birth, @membership_type, @active]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def self.all_active()
    sql = "SELECT * FROM members
           WHERE active"
    result = SqlRunner.run(sql)
    self.map_items(result)
  end

  def update()
    sql = "UPDATE members
           SET (first_name, last_name, date_of_birth, membership_type, active)
           = ($1, $2, $3, $4, $5)
           WHERE id = $6"
    values = [@first_name, @last_name, @date_of_birth, @membership_type, @active, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    self.returns_single_member(results)
  end

  def self.find_by_full_name(first_name, last_name)
    sql = "SELECT * FROM members
           WHERE first_name = $1
           AND last_name = $2"
    values = [first_name, last_name]
    results = SqlRunner.run(sql, values)
    self.returns_single_member(results)
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def show_active()
    if active() == 't'
      return "ACTIVE"
    else
      return "INACTIVE"
    end
  end

  def show_user_active()
    if active() == 't'
      return "ACTIVE"
    else
      return "PENDING"
    end
  end

  def correct_membership?()
    if membership_type() == "PREMIUM"
      return true
    else
      return false
    end
  end

  def formatted_dob()
    formatted_dob = Date.parse(date_of_birth())
    formatted_dob.strftime("%d-%m-%Y")
  end

  def self.map_items(result)
    result.map{|member| Member.new(member)}
  end

  def self.returns_single_member(results)
    return nil if results.first() == nil
    Member.new(results.first())
  end

end
