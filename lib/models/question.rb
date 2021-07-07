require 'net/http'
require 'open-uri'
require 'json'

class Question < ActiveRecord::Base 
    has_many :answers 
    has_many :game_questions
    has_many :games, through: :game_questions

    # URL = "https://opentdb.com/api.php?amount=50&difficulty=easy&type=multiple"
 
   
end 