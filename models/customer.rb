require_relative('../db/sql_runner')

class Customer

 attr_reader :name, :id
 attr_accessor :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end


    def save()
      sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}','#{@funds}') RETURNING id;"
      customers= SqlRunner.run(sql).first
      @id = customers['id'].to_i
    end


    def delete()
      #write sql to delete
      sql = "DELETE FROM customers WHERE id = #{@id};"
      SqlRunner.run(sql)
      #write a quirky return message if desired. 
    end


    def update()
      #write in sql to update
      sql = "UPDATE customers SET (name, funds) = ('#{@name}', '#{@funds}') WHERE id = #{@id};"
      #do not need to return any value. 
      SqlRunner.run(sql)
    end


    def self.all()
      #sql 
      sql = "SELECT * FROM customers;"
      #run get_many function and return results
      customers = Customer.get_many(sql)
      return customers
    end

    def self.get_many(sql)
      customers = SqlRunner.run(sql)
      result = customers.map{|customer| Customer.new(customer)}
    end

    def self.delete_all()
      sql = "DELETE FROM customers;"
      SqlRunner.run(sql)
      return "You deleted everything from customers."
    end

 
    def tickets()
      sql = "SELECT * FROM tickets WHERE tickets.customer_id = #{@id};"
      tickets = Ticket.get_many(sql)
      return tickets
    end

    # Buying tickets should decrease the funds of the customer by the price

  def 
    
  end


end