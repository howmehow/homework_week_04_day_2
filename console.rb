require_relative('models/movie')
require_relative('models/customer')
require_relative('models/ticket')

require('pry')
Customer.delete_all()
Movie.delete_all()

customer1 = Customer.new('name' => 'Bob', 'wallet' => 2500)
customer1.save()
customer2 = Customer.new('name' => 'Kach', 'wallet' => 2500)
customer2.save()
customer3 = Customer.new('name' => 'Michael', 'wallet' => 3000)
customer3.save()

movie1 = Movie.new('title' => 'Zombieland', 'price' => 10)
movie1.save()
movie2 = Movie.new('title' => 'Notebook', 'price' => 10)
movie2.save()
movie3 = Movie.new('title' => 'Santa Claus', 'price' => 10)
movie3.save()

ticket1 = Ticket.new('customer_id' => customer1.id, 'movie_id' => movie1.id)
ticket1.save()
ticket2 = Ticket.new('customer_id' => customer1.id, 'movie_id' => movie2.id)
ticket2.save()
ticket3 = Ticket.new('customer_id' => customer1.id, 'movie_id' => movie3.id)
ticket3.save()


ticket5 = Ticket.new('customer_id' => customer2.id, 'movie_id' => movie2.id)
ticket5.save()
ticket6 = Ticket.new('customer_id' => customer2.id, 'movie_id' => movie3.id)
ticket6.save()

ticket7 = Ticket.new('customer_id' => customer3.id, 'movie_id' => movie1.id)
ticket7.save()
ticket8 = Ticket.new('customer_id' => customer3.id, 'movie_id' => movie2.id)
ticket8.save()



binding.pry
nil
