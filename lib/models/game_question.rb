class GameQuestion < ActiveRecord::Base 
    belongs_to :game 
    belongs_to :question


    def self.create_game_questions(current_game)
        ten_random = Question.all.sample(10)
        GameQuestion.create(game_id: current_game.id, 
                    question_id_one: ten_random[0].id, 
                    question_id_two: ten_random[1].id, 
                    question_id_three: ten_random[2].id, 
                    question_id_four: ten_random[3].id, 
                    question_id_five: ten_random[4].id, 
                    question_id_six: ten_random[5].id, 
                    question_id_seven: ten_random[6].id, 
                    question_id_eight: ten_random[7].id, 
                    question_id_nine: ten_random[8].id, 
                    question_id_ten: ten_random[9].id)
    end

   
    

end 