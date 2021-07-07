class Game < ActiveRecord::Base 
    belongs_to :user
    has_many :game_questions 
    has_many :questions, through: :game_questions


    def self.new_game(current_user)
        Game.create(user_id: current_user.id)
    end
end 