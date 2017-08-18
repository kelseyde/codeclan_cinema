require_relative("../db/sql_runner")

class Movie

  attr_accessor(:title, :price)
  attr_reader(:id)

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @title = details["title"]
    @price = details["price"]
  end

  def self.map_items(items)
    return items.map { |hash| Movie.new(hash) }
  end

  def save
    sql = "
      INSERT INTO movies (title, price)
      VALUES ($1, $2)
      RETURNING id;
      "
    movie_info = SqlRunner.run(sql, [@title, @price])
    @id = movie_info[0]["id"].to_i
  end

  def update
    sql = "
      UPDATE movies SET
      (title, price) = ($1, $2) WHERE id = $3;
      "
    SqlRunner.run(sql, [@title, @price, @id])
  end

  def self.all
    sql = "SELECT * FROM movies;"
    result = self.map_items(SqlRunner.run(sql))
    return result
  end

  def self.delete_all
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM movies WHERE id = $1;"
    SqlRunner.run(sql, @id)
  end

  def customers
    sql = "
      SELECT customers.* FROM customers
      INNER JOIN tickets ON tickets.customer_id = customers.id
      WHERE movie_id = $1;
    "
    result = Customer.map_items(SqlRunner.run(sql, [@id]))
    return result
  end

  def customer_count
    return self.customers.count
  end

end
