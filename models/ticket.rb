class Ticket
  require_relative("../db/sql_runner")
  attr_reader :id, :customer_id, :movie_id
  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @customer_id = options["customer_id"]
    @movie_id = options["movie_id"]
  end

  def save()
  sql = "INSERT INTO tickets (
  customer_id, movie_id
  ) Values (
    $1, $2
    ) RETURNING id"
  values = [@customer_id, @movie_id]
  tickets = SqlRunner.run(sql, values).first()
  @id = tickets['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map{|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
