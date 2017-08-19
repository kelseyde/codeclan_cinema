require_relative("../models/customer")
require_relative("../models/ticket")
require_relative("../models/movie")
require_relative("../models/cinema")
require_relative("../models/showing")
require("pry-byebug")

Ticket.delete_all
Customer.delete_all
Movie.delete_all
Showing.delete_all

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

showing1 = Showing.new({"title" => "The Emoji Movie", "showing" => "10:00"})
showing1.save
showing2 = Showing.new({"title" => "Cars 3", "showing" => "11:30"})
showing2.save
showing3 = Showing.new({"title" => "The Emoji Movie", "showing" => "11:45"})
showing3.save
showing4 = Showing.new({"title" => "The Dark Tower", "showing" => "12:00"})
showing4.save
showing5 = Showing.new({"title" => "Cars 3", "showing" => "12:30"})
showing5.save
showing6 = Showing.new({"title" => "Dunkirk", "showing" => "13:00"})
showing6.save
showing7 = Showing.new({"title" => "Atomic Blonde", "showing" => "13:20"})
showing7.save
showing8 = Showing.new({"title" => "Dunkirk", "showing" => "14:00"})
showing8.save
showing9 = Showing.new({"title" => "The Dark Tower", "showing" => "14:40"})
showing9.save
showing10 = Showing.new({"title" => "Dunkirk", "showing" => "15:00"})
showing10.save
showing11 = Showing.new({"title" => "Atomic Blonde", "showing" => "15:45"})
showing11.save
showing12 = Showing.new({"title" => "The Emoji Movie", "showing" => "16:15"})
showing12.save
showing13 = Showing.new({"title" => "Dunkirk", "showing" => "17:00"})
showing13.save
showing14 = Showing.new({"title" => "The Dark Tower", "showing" => "17:45"})
showing14.save
showing15 = Showing.new({"title" => "Dunkirk", "showing" => "18:30"})
showing15.save
showing16 = Showing.new({"title" => "Atomic Blonde", "showing" => "19:20"})
showing16.save
showing17 = Showing.new({"title" => "Dunkirk", "showing" => "20:00"})
showing17.save
showing18 = Showing.new({"title" => "The Dark Tower", "showing" => "20:45"})
showing18.save
showing19 = Showing.new({"title" => "Dunkirk", "showing" => "21:30"})
showing19.save
showing20 = Showing.new({"title" => "Dunkirk", "showing" => "22:00"})
showing20.save

ticket1 = Ticket.new({"customer_id" => patrick.id, "movie_id" => dunkirk.id, "showing_id" => showing17.id})
ticket1.save
ticket2 = Ticket.new({"customer_id" => belinda.id, "movie_id" => atomic_blonde.id, "showing_id" => showing11.id})
ticket2.save
ticket3 = Ticket.new({"customer_id" => tommy.id, "movie_id" => dark_tower.id, "showing_id" => showing4.id})
ticket3.save
ticket4 = Ticket.new({"customer_id" => jennifer.id, "movie_id" => emoji.id, "showing_id" => showing1.id})
ticket4.save
ticket5 = Ticket.new({"customer_id" => patrick.id, "movie_id" => cars3.id, "showing_id" => showing5.id})
ticket5.save
ticket6 = Ticket.new({"customer_id" => tommy.id, "movie_id" => dunkirk.id, "showing_id" => showing20.id})
ticket6.save
ticket7 = Ticket.new({"customer_id" => belinda.id, "movie_id" => emoji.id, "showing_id" => showing12.id})
ticket7.save
ticket8 = Ticket.new({"customer_id" => belinda.id, "movie_id" => emoji.id, "showing_id" => showing12.id})
ticket8.save
ticket9 = Ticket.new({"customer_id" => patrick.id, "movie_id" => dunkirk.id, "showing_id" => showing20.id})
ticket9.save
ticket10 = Ticket.new({"customer_id" => jennifer.id, "movie_id" => dunkirk.id, "showing_id" => showing20.id})
ticket10.save

codeclan_cinema = Cinema.new(
  "CodeClan Cinema",
  [dunkirk, dark_tower, cars3, atomic_blonde, emoji],
  2500
)

binding.pry
nil
