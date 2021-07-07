require 'net/http'
require 'open-uri'
require 'json'



URL = "https://opentdb.com/api.php?amount=50&difficulty=easy&type=multiple"

def get_all_questions
    
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
end

def create_questions_and_answers
    everything = get_all_questions
    all_questions = JSON.parse(everything)
    all_questions["results"].each do |questions_hash|
    category = questions_hash["category"]
    question = questions_hash["question"]
    question_row = Question.find_or_create_by(category: category, question: question)
    create_answers(question_row, questions_hash)
    end
    end

def create_answers(question_row, questions_hash)

    answer = questions_hash["correct_answer"]
    answer_row = Answer.find_or_create_by(answer: answer, question_id: question_row.id, correct: true)
    questions_hash["incorrect_answers"].each do |inc_answer|
    Answer.find_or_create_by(answer: inc_answer, question_id: question_row.id)
    
    end
end

create_questions_and_answers