require_relative '../config/environment'
require 'tty-prompt'
require 'lolcat'

puts `clear`
pid = fork{ system 'afplay', "lib/E-20.mp3" }
fork{exec 'lolcat -a -d 4 /Users/a_norton/mod1/Project/ruby-project-guidelines-atx01-seng-ft-071320/lib/title'}
sleep(13)


Cli.new.welcome_message
