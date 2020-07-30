#require 'pry'
require 'tty-prompt'
class Cli

    attr_reader :journal_user

    def ascii_welcome
        File.readlines("./lib/ascii_welcome.txt") do |line|
          puts line
        end
    end

     def ascii_breathein
        File.readlines("./lib/ascii_breathein.txt") do |line|
          puts line
        end
    end

    def welcome_message
        puts "Welcome to Emoticreate!" 
        puts "Please tell me your name."
        user_n = gets.chomp

        find_name = User.find{|user| user.name.upcase == user_n.upcase}
        @journal_user = User.find_or_create_by(name: user_n)
    
        if find_name
            puts ascii_welcome
            #binding.pry
            puts "\nWelcome back #{user_n}! Let's take some time to reflect on our day."
            puts "To help with that, let's do a breathing exercise."
            2.times do 
                sleep(2.seconds)
                puts "Ready?"
                sleep(1.seconds)
                    puts ascii_breathein
                    sleep(4.seconds)
                    puts "Hold..."
                    sleep(8.seconds)
                    puts "Breathe out..."
                    sleep(6.seconds)
                    puts "Let's do it again!"
                    sleep(2.seconds)
                    puts `clear`
            end
            
        else
            puts "\nWelcome to Emoticreate, #{user_n}! Let's take some time to reflect on our day."
            puts "To help with that, let's do a breathing exercise."
            2.times do
                sleep(2.seconds)
                puts "Ready?"
                sleep(1.seconds)
                    puts "Breathe in..."
                    sleep(4.seconds)
                    puts "Hold..."
                    sleep(8.seconds)
                    puts "Breathe out..."
                    sleep(6.seconds)
                    puts "Let's do it again!"
                    sleep(2.seconds)
                    puts `clear`
            end
        end
#binding.pry
    end
end


# puts breathe in 
# sleep(2 seconds)
# puts "4..."
# sleep(1 scond)
# puts "3...."