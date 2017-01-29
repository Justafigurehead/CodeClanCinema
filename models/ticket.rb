require_relative('../db/sql_runner')
require_relative('film.rb')

class Ticket

attr_accessor :film_id, :customer_id, :id

 
  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end
    

    def save()
      sql = "INSERT INTO tickets(customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') returning id;"
      tickets = SqlRunner.run(sql).first
      @id = tickets['id'].to_i
    end


    def delete()
      sql = "DELETE FROM tickets WHERE id = #{@id};"
      SqlRunner.run(sql)
      return "You have deleted an entry for tickets."
    end

    def update()
      sql = "UPDATE tickets SET (customer_id, film_id) = ('#{@customer_id}', '#{@film_id}') WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def self.all()
      #write sql 
      sql = "SELECT * FROM customers;"
      #run sql and return result that is mapped to our class.
      tickets = Ticket.get_many(sql)
      return tickets
    end


    def self.get_many(sql)
      tickets = SqlRunner.run(sql)
      result = tickets.map{|ticket| Ticket.new(ticket)}
    end
    
    def self.delete_all()
      sql = "DELETE FROM tickets;"
      SqlRunner.run(sql)
      return "You have deleted everything from tickets."
    end

    def films()
      sql = "SELECT * FROM films WHERE id = #{@film_id};"
      films = SqlRunner.run(sql).first
      return Film.new(films)
    end

#why can't I show multiple entries??
    def customer()
      sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
      customers = SqlRunner.run(sql).first
     result = customers.map{|customer| Customer.new(customer)}
     return result
       
    end

   def buy_ticket()
     #we want to create a function that DECREASES the FUNDS of a CUSTOMER by the PRICE of the FILM WHEN they buy a TICKET.

     #step 1 call function on an instane of a ticket. Select the instance of the customer. 
   #can subject a set integar but can't figure out how to subtract the price. 

     sql = "UPDATE customers 
    SET funds = funds - 10 WHERE customers.id = #{@customer_id};"
      SqlRunner.run(sql)

     end

end