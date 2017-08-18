require_relative("../db/sql_runner")

class Ticket

  attr_accessor(:customer_id, :movie_id)
  attr_reader(:id)

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @customer_id = details["customer_id"]
    @movie_id = details["movie_id"]
  end

  def self.map_items(items)
    return items.map { |hash| Ticket.new(hash) }
  end

  def save
    sql = "
      INSERT INTO tickets (customer_id, movie_id)
      VALUES ($1, $2)
      RETURNING id;
      "
    ticket_info = SqlRunner.run(sql, [@customer_id, @movie_id])
    @id = ticket_info[0]["id"].to_i
  end

  def update
    sql = "
      UPDATE tickets SET
      (customer_id, movie_id) = ($1, $2) WHERE id = $3;
      "
    SqlRunner.run(sql, [@customer_id, @movie_id, @id])
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    result = self.map_items(SqlRunner.run(sql))
    return result
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1;"
    SqlRunner.run(sql, @id)
  end

end
