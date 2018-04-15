require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize (options)
    @id = options ['id'].to_i if options['id']
    @customer_id = options ['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @film_id]
    visit = SqlRunner.run(sql,values).first
    @id = visit['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1;"
    values = [@film_id]
    film_hash = SqlRunner.run(sql, values).first()
    return Film.new(film_hash)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1;"
    values = [@customer_id]
    customer_hash = SqlRunner.run(sql, values).first()
    return Customer.new(customer_hash)
  end

  

  # def self.map_tickets(ticket_data)
  #   return ticket_data.map {|ticket_hash| Film.new(ticket_hash)}
  # end
  # -- Commands for joining tables
  # -- star_wars# SELECT jedi.*, lightsabers.* FROM jedi INNER JOIN lightsabers ON jedi.id  = lightsabers.owner_id;
  # -- star_wars=# SELECT jedi.name, lightsabers.colour FROM jedi INNER JOIN lightsabers ON jedi.id = lightsabers.owner_id;
  # -- star_wars=# SELECT j.name, j.age, l.colour, l.hilt_metal FROM jedi AS j INNER JOIN lightsabers AS l ON j.id = l.owner_id;
  # -- zombies=# SELECT zombies.*, bitings.*, victims.* FROM zombies INNER JOIN bitings ON zombies.id = bitings.zombie_id INNER JOIN victims ON victims.id = bitings.victim_id ;

end
