class CreateAnswers < ActiveRecord::Migration[6.0]
    def change 
        create_table :answers do |t|
            t.integer :question_id 
            t.string :answer
            t.boolean :correct, default: false
            
        end 
    end 
end 