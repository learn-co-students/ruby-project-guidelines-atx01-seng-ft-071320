require 'tty-prompt'
require 'open-uri'
require 'json'
require 'pry'
require 'net/http'
require 'openssl'

class User < ActiveRecord::Base
    has_many :entries
    has_many :journals, through: :entries
    attr_accessor :current_entry

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

    def write_new_entry(entry, emotion, journal_type)
        self.entries.create(entry_text: entry, emotion: emotion, journal: journal_type)
    end

    def personal_entry
        #puts "This method has not been written"
        personal = Journal.all.find {|journal| journal.name == "Personal"}
        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to your personal journal!"
        entry = prompt.ask("Write a sentence here:")
        puts "Let's analyze your emotions!" #put spinner while finding emotion
        emo = find_emotion(entry)
        puts "Your emotion analysis finds that the primary emotion of this entry is: #{emo}"
        write_new_entry(entry, emo, personal)
        if %w(sadness anger fear disgust).include? emo
            puts "It's no fun to feel negative emotions! Perhaps a moment of zen will help!"
            moment_of_zen
        else
            puts "Looks like you had a great day!"
        end
        puts "Thank you for taking the time to reflect on your day!" #go back to menu or exit
    end

    def work_entry
        puts "This method has not been written"
    end
    
    def activity_entry
        puts "This method has not been written"
    end

    def find_emotion(input)
        text = input
        a = text.split
        b = Array.new(a.length, "%20")
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
        return emotions
    end

    def moment_of_zen
        puts "This will be a moment of zen <3 maybe we can do something funny here"
    end
end