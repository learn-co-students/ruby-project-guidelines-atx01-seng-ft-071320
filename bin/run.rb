require_relative '../config/environment'
require 'pry'
require 'rest-client'

tomas = User.find_or_create_by(username:"Tomas Username")
sohyun = User.find_or_create_by(username:"Sohyun Username")

article1 = Article.find_or_create_by(title: "Test Article_1")
article2 = Article.find_or_create_by(title: "Test Article_2")
article3 = Article.find_or_create_by(title: "Test Article_3")

rm = RestClient.get "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=Y4GhdvAkcPH7EAXFvn2Uyw45U5C9GsqT"
rm_array = JSON.parse(rm)["results"]
 rm_array.each do |article|
     Article.create(
         title: article["title"],
         abstract: article["abstract"],
         category: article["section"],
         author: article["byline"],
         url: article["url"]   
     )
    end
binding.pry

puts "HELLO WORLD"

# rm_array.each do |character|
#     Character.create(
#     name: character[“name”],
#     status: character[“status”],
#     species: character[“species”],
#     gender: character[“gender”],
#     image: character[“image”]
#     )
#    end