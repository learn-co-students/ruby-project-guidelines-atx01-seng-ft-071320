class CreateGameQuestions < ActiveRecord::Migration[6.0]
    def change 
        create_table :game_questions do |t|
            t.integer :game_id
            t.integer :question_id_one
            t.integer :question_id_two
            t.integer :question_id_three
            t.integer :question_id_four
            t.integer :question_id_five
            t.integer :question_id_six
            t.integer :question_id_seven
            t.integer :question_id_eight
            t.integer :question_id_nine
            t.integer :question_id_ten 
        end
    end 
end 