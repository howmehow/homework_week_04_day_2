class Movie
  require_relative("../db/sql_runner")
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @price = options["price"]
  end
  def save()
    sql = "INSERT INTO movies (
    title, price) VALUES ( $1, $2
    ) RETURNING id"
    values = [@title, @price]
    movies = SqlRunner.run(sql, values).first()
    @id = movies["id"].to_i()
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN Tickets
    ON customers.id = tickets.customer_id
    WHERE movie_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    results = customers.map{|customer| Customer.new(customer)}
    return results
  end

  def update()
    sql = "UPDATE movies SET (
    title, price) = ($1,$2
    ) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql,values)
  end

  def self.search(id)
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [id]
    movies = SqlRunner.run(sql, values).first
    return Movie.new(movies)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    result = movies.map{|movie| Movie.new(movie)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end
end
