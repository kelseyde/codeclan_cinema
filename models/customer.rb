require_relative("../db/sql_runner")
require("pry-byebug")

class Customer

  attr_accessor(:name, :cash)
  attr_reader(:id)

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
    @cash = details["cash"]
  end

  def self.map_items(items)
    return items.map { |hash| Customer.new(hash) }
  end

  def save
    sql = "
      INSERT INTO customers (name, cash)
      VALUES ($1, $2)
      RETURNING id;
      "
    customer_info = SqlRunner.run(sql, [@name, @cash])
    @id = customer_info[0]["id"].to_i
  end

  def update
    sql = "
      UPDATE customers SET
      (name, cash) = ($1, $2) WHERE id = $3;
      "
    SqlRunner.run(sql, [@name, @cash, @id])
  end

  def self.all
    sql = "SELECT * FROM customers;"
    result = self.map_items(SqlRunner.run(sql))
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1;"
    SqlRunner.run(sql, @id)
  end

  def movies
    sql = "
      SELECT movies.* FROM movies
      INNER JOIN tickets ON tickets.movie_id = movies.id
      WHERE customer_id = $1;
    "
    result = Movie.map_items(SqlRunner.run(sql, [@id]))
    return result
  end

  def ticket_count
    sql = "SELECT * FROM tickets WHERE tickets.customer_id = $1;"
    result = Ticket.map_items(SqlRunner.run(sql, [@id])).length
    return result
  end

  def buy_ticket(cinema, *movies)
    movies.each do |movie|
      if !cinema.movies.include?(movie)
        return "#{cinema.name} is not showing #{movie.title}."
      elsif @cash < movie.price
        return "Insufficient funds."
      else
        @cash -= movie.price
        cinema.cash += movie.price
        ticket = Ticket.new({"customer_id" => @id, "movie_id" => movie.id})
        ticket.save
        self.update
      end
    end
  end

end
