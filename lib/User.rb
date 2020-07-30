require 'tty-prompt'
require 'open-uri'
require 'json'
require 'pry'
require 'net/http'
require 'openssl'
require 'table_print'
require 'awesome_print'
require 'whirly'
require 'paint'

class User < ActiveRecord::Base
    has_many :entries
    has_many :journals, through: :entries
    attr_accessor :current_entry, :newline

    def menu
        puts `clear`
        prompt = TTY::Prompt.new
        menu_select = prompt.select("What would you like to do in your journal today?", ["Write a new entry", "See all entries", "Delete an entry","Find entries by emotion", "Find entries by journal type", "Exit"])
        
        case menu_select
        when "Write a new entry"
            select_journal
        when "See all entries"
            see_all_entries
        when "Delete an Entry"
            see_all_entries
        when "Find entries by emotion"
            find_entries_by_emotion
        when "Find entries by journal type"
            find_entries_by_journal_type
        when "Exit"
            close_journal
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

    def write_new_entry(entry, emotion, journal_type, journal_name)
        self.entries.create(entry: entry, emotion: emotion, journal: journal_type, journal_name: journal_name)
        #binding.pry 
    end

    def personal_entry
        #puts "This method has not been written"
        journal_name = "Personal"
        personal = Journal.find_or_create_by(name: journal_name)
        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to your personal journal!"
        entry = prompt.ask("Write a sentence here:") do |q|
            q.required true
            q.validate /\D\w\s./
            q.messages[:valid?] = "Invalid entry. Try again with a word or sentence."
        end 
        puts "Let's analyze your emotions!" #put spinner while finding emotion
        Whirly.configure spinner: "bouncingBall", status: "A n a l y z i n g     E m o t i o n s"
        Whirly.start do 
            sleep 0.5 
        end
        emo = find_emotion(entry)
        puts "Your emotion analysis finds that the primary emotion of this entry is: #{emo}"
        puts "\n"
        sleep(2)
        puts "\n"
        write_new_entry(entry, emo, personal, journal_name)
        if %w(sadness anger fear disgust).include? emo
            puts "It's no fun to feel negative emotions! Perhaps a moment of zen will help!"
            moment_of_zen
        elsif %w(neutral nothing).include? emo
            puts "Looks like your day was just ok, and that's fine! Not every day can be amazing."
        else
            puts "Looks like you had a great day!"
        end
        puts "\n"
        puts "\n" # refactor lines
        puts "Thank you for taking the time to reflect on your day!" #go back to menu or exit
        after_entry_options
    end

    def work_entry
        journal_name = "Work"
        work = Journal.find_or_create_by(name: journal_name)
        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to your work journal!"
        entry = prompt.ask("Write a sentence here:") do |q|
            q.required true
            q.validate /\D\w\s./
            q.messages[:valid?] = "Invalid entry. Try again with a word or sentence."
        end
        puts "Let's analyze your emotions!" #put spinner while finding emotion
        Whirly.configure spinner: "bouncingBall", status: "A n a l y z i n g     E m o t i o n s"
        Whirly.start do 
            sleep 1 
        end
        emo = find_emotion(entry)
        puts "Your emotion analysis finds that the primary emotion of this entry is: #{emo}"
        puts "\n"
        sleep(2)
        puts "\n"
        write_new_entry(entry, emo, work, journal_name)
        if %w(sadness anger fear disgust).include? emo
            puts "It's no fun to feel negative emotions! Perhaps a moment of zen will help!"
            moment_of_zen
        elsif %w(neutral nothing).include? emo
            puts "Looks like your day was just ok, and that's fine! Not every day can be amazing."
        else
            puts "Looks like you had a great day!"
        end
        puts "\n"
        puts "\n" # refactor lines
        after_entry_options
    end
    
    def activity_entry
        journal_name = "Activity"
        activity = Journal.find_or_create_by(name: journal_name)
        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to your activity journal!"
        entry = prompt.ask("Write a sentence here:") do |q|
            q.required true
            q.validate /\D\w\s./
            q.messages[:valid?] = "Invalid entry. Try again with a sentence (or two!)"
        end
        puts "Let's analyze your emotions!" #put spinner while finding emotion
        Whirly.configure spinner: "bouncingBall", status: "A n a l y z i n g     E m o t i o n s"
        Whirly.start do 
            sleep 1 
        end
        emo = find_emotion(entry)
        puts "Your emotion analysis finds that the primary emotion of this entry is: #{emo}"
        puts "\n"
        sleep(2)
        puts "\n"
        write_new_entry(entry, emo, activity, journal_name)
        if %w(sadness anger fear disgust).include? emo
            puts "It's no fun to feel negative emotions! Perhaps a moment of zen will help!"
            moment_of_zen
        elsif %w(neutral nothing).include? emo
            puts "Looks like your day was just ok, and that's fine! Not every day can be amazing."
        else
            puts "Looks like you had a great day!"
        end
        puts "\n"
        puts "\n" # refactor lines
        puts "Thank you for taking the time to reflect on your day!" #go back to menu or exit
        after_entry_options
    end

    def find_emotion(input)
        text = input
        a = text.split
        b = Array.new(a.length, "%20") #"I%20Had%20fun"
        new_text = a.zip(b).flatten
        new_text.pop
        insert = new_text.join
        #binding.pry 
        url = URI("https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/?text=#{insert}")
        #binding.pry 

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'twinword-emotion-analysis-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = 'adced4ae6amshb206e15787ec65dp17d3adjsncabafd1abcbf'

        response = http.request(request)
        #puts response.read_body
        result = JSON.parse(response.read_body)
        #emotions = result["emotion_scores"].select{|k,v| k if v > 0.02}
        #emotions = result["emotions_detected"].join(", ")
        emotion_scores = result["emotion_scores"].select {|k,v| k if v > 0.02}
        emotions = emotion_scores.keys[0]          #.join(", ")
        neutral = "neutral"
        if emotions == nil 
            return neutral
        else
            return emotions
        end
    end

    def moment_of_zen
        puts "This will be a moment of zen <3 maybe we can do something funny here"
        sleep(2.seconds)
        puts `clear`
    end

    def after_entry_options
        prompt = TTY::Prompt.new
        menu_or_close = prompt.select("What would you like to do now?", ["Go back to home screen", "Close journal"])
            case menu_or_close
            when "Go back to home screen"
                menu
            when "Close journal"
                close_journal
            end
    end

    def close_journal
        puts "This will close the application"
    end 

    def see_all_entries
        prompt = TTY::Prompt.new
        @newline = "\n\n\n"
        puts `clear`
        puts "Here is a list of all your entries:"
        sleep(1.seconds)
        puts @newline
        tp Entry.where(user: self), :id, :entry, :emotion, :created_on, :journal_name
        #tp Entry.all, :entry_text, :emotion
        puts @newline
        select_entry = prompt.yes?("Would you like to select an entry?")
        if select_entry
            select_entry_by_id
        else
            puts @newline
            after_entry_options
        end
    end

    def find_entries_by_emotion
        puts `clear`
        choices = %w(joy surprise neutral sadness fear anger disgust)
        prompt = TTY::Prompt.new
        select_emo = prompt.multi_select("Which emotion(s) do you want to find entries for?", choices)
        puts @newline
        #binding.pry
        tp Entry.where(user: self, emotion: select_emo).order('emotion ASC'), :id, :entry, :emotion, :created_on, :journal_name
        puts @newline
        after_entry_options
    end

    def find_entries_by_journal_type
        puts `clear`
        choices = %w(Personal Work Activity)
        prompt = TTY::Prompt.new
        journal_name = prompt.multi_select("Which journal(s) do you want to find entries for?", choices)
        puts @newline
        #binding.pry
        tp Entry.where(user: self, journal_name: journal_name).order('journal_name ASC'), :id, :entry, :emotion, :created_on, :journal_name
        puts @newline
        after_entry_options
    end

    def select_entry_by_id
        prompt = TTY::Prompt.new
        puts @newline
        #tp Entry.where(user: self), :id, :entry, :emotion, :created_on, :journal_name
        #puts @newline
        id = prompt.ask("Which entry would you like to select?")
        selected = Entry.where(user: self, id: id).first 
        tp Entry.where(user: self, id: id), :id, :entry, :emotion, :created_on, :journal_name
        @current_entry = selected
        puts @newline
        view_entry = prompt.yes?("Would you like to view the full entry?")
        if view_entry
            ap @current_entry.entry 
            delete_entry = prompt.yes?("Would you like to delete this entry?")
            if delete_entry
                @current_entry.destroy
            else
                after_entry_options
            end
        end
        delete_entry = prompt.yes?("Would you like to delete this entry?")
            if delete_entry
                @current_entry.destroy
            else
                after_entry_options
            end
        after_entry_options
    end

end


# if joy
#     puts "look at all your happy entries"
# elsif sadness
#     puts "look at your sad entries "