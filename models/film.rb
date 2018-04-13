require_relative("../db/sql_runner")
require_relative('customer.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options["id"].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films(title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film_hash| Film.new(film_hash) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@title, @price, $id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN ticketss ON customers.customer_id WHERE tickets.film_id =$1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map {|customer_hash| Customer.new(customer_hash)}
  end

end
