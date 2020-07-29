require 'tty-prompt'
class User < ActiveRecord::Base
    has_many :entries
    has_many :journals, through: :entries
    attr_accessor :current_entry, :emotion

    def menu
        puts `clear`
        prompt = TTY::Prompt.new
        menu_select = prompt.select("What would you like to do in your journal today?", ["Write a new entry"])
        
        case menu_select
        when "Write a new entry"
            select_journal
        end
    end

    def select_journal
        prompt = TTY::Prompt.new
        journal_select = prompt.select("Which journal best describes what you would like to write about?", ["Personal", "Work", "Activity"])
        if journal_select == "Personal"
            personal_entry
        elsif journal_select == "Work"
            work_entry
        else
            activity_entry
        end 
    end 

    def personal_entry
        #puts "This method has not been written"
        personal = Journal.all.find {|journal| journal.name == "Personal"}
        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to your personal journal!"
        entry = prompt.ask("Write a sentence here:")
        puts "Thank you for taking the time to reflect on your day!" #go back to menu or exit
    end

    def work_entry
        puts "This method has not been written"
    end
    
    def activity_entry
        puts "This method has not been written"
    end
end