# MWelcome to J O U R N A L W A V E

A simple, retro-futuristic journal app that can analyze the emotions of your entries, with some other fun features!

### Motivation

We wanted to build an app using object relationships that allows the user to create journal entries and perform basic search, store, and delete functions. This journal app allows you to do all of that, and more.

### Screenshot

![Alt text](jwave_screenshot.png?raw=true "Title Screen")

## Getting Started

### Gems

source "https://rubygems.org"

gem "sinatra-activerecord", '~>2.0'
gem "sqlite3", '~>1.4.2'
gem "pry"
gem "require_all"
gem 'activerecord'
gem 'rake'
gem 'tty-prompt', '~> 0.22.0'
gem 'table_print'
gem 'tty-spinner'
gem 'whirly'
gem 'paint'
gem 'awesome_print'
gem 'lolcat'
gem 'colorize'

### Executing the Program

Fork and clone the Journalwave repo
Run bundle install
Run rake db:migrate
Run rake db:seed
Run ruby ./bin/run.rb

## API, Credits, and Contributions
### API Reference

Journalwave uses the Twinword Emotional Analysis API

https://rapidapi.com/twinword/api/emotion-analysis

### How To Use

Begin the program by following the installation instructions above. 
Once started, you can choose to do a relaxing breathing exercise.
Once you're at the main menu, use your cursor to select which action you'd like to take (we recommend starting with write an entry!)
When finished, selext exit to close the program (and see a cute kitty!)

### Credits
Music is by Cellars (one of the creators of this application) ALL RIGHTS RESERVED
All ASCII text was generated using TAAG (text to ASCII art generator) : http://patorjk.com/software/taag/#p=testall&f=X992&t=Welcome
ASCII art found at https://user.xmission.com/~emailbox/ascii_cats.htm and https://ascii.co.uk/art/beach
created by github users @allenorton and @christina888

### Contributions
Anyone who wishes to contribute should fork and clone the repository to their local repo.
Please contact a creator before pushing to the master branch!

### License

##Learn.co Educational Content License

Copyright (c) 2015 Flatiron School, Inc

The Flatiron School, Inc. owns this Educational Content. However, the Flatiron School supports the development and availability of educational materials in the public domain. Therefore, the Flatiron School grants Users of the Flatiron Educational Content set forth in this repository certain rights to reuse, build upon and share such Educational Content subject to the terms of the Educational Content License set forth here (http://learn.co/content-license). You must read carefully the terms and conditions contained in the Educational Content License as such terms govern access to and use of the Educational Content.

Flatiron School is willing to allow you access to and use of the Educational Content only on the condition that you accept all of the terms and conditions contained in the Educational Content License set forth here (http://learn.co/content-license). By accessing and/or using the Educational Content, you are agreeing to all of the terms and conditions contained in the Educational Content License. If you do not agree to any or all of the terms of the Educational Content License, you are prohibited from accessing, reviewing or using in any way the Educational Content.
