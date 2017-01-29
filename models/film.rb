require_relative('../db/sql_runner')

class Film

attr_accessor :title, :price, :id
 
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

    def save()
      sql = "INSERT INTO films (title, price) VALUES ('#{@title}','#{@price}') returning id;"
      films = SqlRunner.run(sql).first
      @id = films['id'].to_i
    end


    def delete()
      sql = "DELETE FROM films WHERE id = #{id};"
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE films SET (title, price) = ('#{@title}', '#{@price}') WHERE id = #{@id};"
      SqlRunner.run(sql)
    end


    def self.all()
      sql = "SELECT * FROM films;"
      films = Film.get_many(sql)
      return films 
    end

    
    def self.delete_all()
      sql = "DELETE FROM films;"
      SqlRunner.run(sql)
    end

    def self.get_many(sql)
      films = SqlRunner.run(sql)
      result = films.map{|film| Film.new(film)}
      return result 
    end 

    def customers()
      sql = "SELECT * FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id};" 
      customers = Customer.get_many(sql)
      return customers
      
    end


end