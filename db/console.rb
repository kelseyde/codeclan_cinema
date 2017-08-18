require_relative("../models/customer")
require_relative("../models/ticket")
require_relative("../models/movie")
require_relative("../models/cinema")
require("pry-byebug")

Ticket.delete_all
Customer.delete_all
Movie.delete_all


patrick = Customer.new({"name" => "Patrick", "cash" => 100})
patrick.save
belinda = Customer.new({"name" => "Belinda", "cash" => 250})
belinda.save
tommy = Customer.new({"name" => "Tommy", "cash" => 15})
tommy.save
jennifer = Customer.new({"name" => "Jennifer", "cash" => 20})
jennifer.save


dunkirk = Movie.new({"title" => "Dunkirk", "price" => 10})
dunkirk.save
dark_tower = Movie.new({"title" => "The Dark Tower", "price" => 8})
dark_tower.save
cars3 = Movie.new({"title" => "Cars 3", "price" => 6})
cars3.save
atomic_blonde = Movie.new({"title" => "Atomic Blonde", "price" => 7})
atomic_blonde.save
emoji = Movie.new({"title" => "The Emoji Movie", "price" => 25})
emoji.save

ticket1 = Ticket.new({"customer_id" => patrick.id, "movie_id" => dunkirk.id})
ticket1.save
ticket2 = Ticket.new({"customer_id" => belinda.id, "movie_id" => atomic_blonde.id})
ticket2.save
ticket3 = Ticket.new({"customer_id" => tommy.id, "movie_id" => dark_tower.id})
ticket3.save
ticket4 = Ticket.new({"customer_id" => jennifer.id, "movie_id" => emoji.id})
ticket4.save
ticket5 = Ticket.new({"customer_id" => patrick.id, "movie_id" => cars3.id})
ticket5.save
ticket6 = Ticket.new({"customer_id" => tommy.id, "movie_id" => dunkirk.id})
ticket6.save
ticket7 = Ticket.new({"customer_id" => belinda.id, "movie_id" => emoji.id})
ticket7.save

codeclan_cinema = Cinema.new(
  "CodeClan Cinema",
  [dunkirk, dark_tower, cars3, atomic_blonde, emoji],
  2500
)

binding.pry
nil
