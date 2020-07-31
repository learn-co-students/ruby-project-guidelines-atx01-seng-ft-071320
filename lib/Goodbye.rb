require 'lolcat'
class Goodbye
    puts `clear`
    puts `clear`
    def bye 
        fork{exec 'lolcat -a -d 4 /Users/a_norton/mod1/Project/ruby-project-guidelines-atx01-seng-ft-071320/lib/bye'}
        sleep 5
        pid = fork{ system 'killall', 'afplay' }
    end 
end