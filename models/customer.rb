class Customer
  require_relative("../db/sql_runner")
attr_reader :id
attr_accessor  :name, :wallet
  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @wallet = options["wallet"]
  end

  def save()
    sql = "INSERT INTO customers (
    name, wallet
    ) VALUES ($1, $2) RETURNING id"
    values = [@name, @wallet]
    customers = SqlRunner.run(sql, values).first()
    @id = customers["id"].to_i()
  end

  def movies()
    sql = "SELECT movies.* FROM movies
    INNER JOIN tickets
    ON movies.id = tickets.movie_id
    WHERE customer_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    results = movies.map{|movie| Movie.new(movie)}
    return results
  end

  def update()
    sql = "UPDATE customers SET (
    name, wallet) = ($1, $2
    ) WHERE id = $3"
    values = [@name, @wallet, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
