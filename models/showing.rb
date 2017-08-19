require_relative("../db/sql_runner")

class Showing

  attr_accessor(:title, :showing)
  attr_reader(:id)

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @title = details["title"]
    @showing = details["showing"]
    @max_tickets = 3
  end

  def self.map_items(items)
    return items.map { |hash| Showing.new(hash) }
  end

  def save
    sql = "
      INSERT INTO showings (title, showing)
      VALUES ($1, $2)
      RETURNING id;
      "
    showing_info = SqlRunner.run(sql, [@title, @showing])
    @id = showing_info[0]["id"].to_i
  end

  def update
    sql = "
      UPDATE showings SET
      (title, showing) = ($1, $2) WHERE id = $3;
      "
    SqlRunner.run(sql, [@title, @showing, @id])
  end

  def self.all
    sql = "SELECT * FROM showings;"
    result = self.map_items(SqlRunner.run(sql))
    return result
  end

  def self.delete_all
    sql = "DELETE FROM showings;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM showings WHERE id = $1;"
    SqlRunner.run(sql, @id)
  end

  def tickets_sold
    sql = "SELECT * FROM tickets WHERE showing_id = $1"
    result = Ticket.map_items(SqlRunner.run(sql, [@id]))
    return result.count
  end

  def full?
    return self.tickets_sold == @max_tickets
  end



end
