require_relative '../config/environment'
require 'pry'
require 'rest-client'

#tomas = User.find_or_create_by(username:"Tomas Username")
# sohyun = User.find_or_create_by(username:"Sohyun Username")

#binding.pry

app = NytApp.new
app.run
