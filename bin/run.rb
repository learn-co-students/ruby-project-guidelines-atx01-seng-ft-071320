require_relative '../config/environment'
require 'pry'

tomas = User.find_or_create_by(username:"Tomas Username")
sohyun = User.find_or_create_by(username:"Sohyun Username")

article1 = Article.find_or_create_by(title: "Test Article_1")
article2 = Article.find_or_create_by(title: "Test Article_2")
binding.pry

puts "HELLO WORLD"
