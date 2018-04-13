require_relative("../db/sql_runner")
# require("film.rb")

class Customer
  attr_reader :id
  attr_accessor :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options ['name']
    @funds = options ['funds']
  end

  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
      sql = "UPDATE customers SET name = $1 WHERE id = $2;"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  def films()
    sql = "SELECT filmss.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
    values = [@id]
    locations = SqlRunner.run(sql, values)
    return films.map{|film_hash| Film.new(film_hash)}
  end

end
