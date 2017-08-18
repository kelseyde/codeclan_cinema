class Cinema

  attr_accessor(:name, :movies, :cash)

  def initialize(name, movies=[], cash=0)
    @name = name
    @movies = movies
    @cash = cash
  end

end
