 require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')

require('pry-byebug')


#---- Customers
customer1 = Customer.new({'name' => "Brendan Fraser", 'funds' => 10})

customer1.save()

customer2 = Customer.new({'name' => "Nicholas Hoult", 'funds' => 50})

customer2.save()

customer3 = Customer.new({'name' => "Robert Downey Jr", 'funds' => 1000})

customer3.save()


customer4 = Customer.new({'name' => "Lena Headey", 'funds' => 100})

customer4.save()


#---- Films

film1 = Film.new({'title' => 'Guardians of the Galaxy 2', 'price' => 13})
film2 = Film.new({'title' => 'Star Wars: The Last Jedi', 'price' => 20})
film3 = Film.new({'title' => 'Donnie Darko','price'=> 10})
film4 = Film.new({'title' => 'The Mummmy', 'price' => 2})

film1.save()
film2.save()
film3.save()
film4.save()

#---- Tickets

  ticket1 = Ticket.new({'customer_id'=> customer1.id, 'film_id' => film4.id})
  ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
  ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
  ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
  ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film4.id})
  ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()

binding.pry
nil