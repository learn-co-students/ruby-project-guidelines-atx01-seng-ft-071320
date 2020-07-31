require_relative '../config/environment'
require 'tty-prompt'
require 'lolcat'

puts `clear`
fork{exec 'lolcat -a -d 4 /Users/a_norton/mod1/Project/ruby-project-guidelines-atx01-seng-ft-071320/lib/title'}
sleep(5)


Cli.new.welcome_message
