require_relative('models/customer.rb')
# require_relative('models/film.rb')
# require_relative('models/ticket.rb')

require('pry-byebug')

# Ticket.delete_all()
# Film.delete_all()
# Customer.delete_all()

customer1 = Customer.new({'name' => 'Arthur Dayne','funds' => 500})
customer1.save()
customer2 = Customer.new({'name' => 'Moqorro The Red Priest','funds' => 200})
customer2.save()
customer3 = Customer.new({'name' => 'Azor Ahai','funds' => 150 })
customer3.save()
#
# location1 = Film.new({
#   'title' => 'La Haine',
#   'price' => '80'})
# location1.save()
# location2 = Film.new({
#   'title' => 'Police Academy 5: Assignment Miami Beach',
#   'price' => '75'})
# location2.save()
# location3 = Film.new({
#   'title' => 'Uncle Buck',
#   'price' => '1'})
# location3.save()
#
# ticket1 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film1.id})
# ticket1.save()
# ticket2 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id})
# ticket2.save()
# ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id})
# ticket3.save()
# ticket4 Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id})
# ticket4.save()
# ticket5 Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
# ticket4.save()

# for user in location1.users()
#
# p user.name
# end

binding.pry
nil
