#this is where our seeds will go

personal = Journal.create(name: "Personal")
work = Journal.create(name: "Work")
activity = Journal.create(name: "Activity")

allene = User.create(name: "Allene")
christina = User.create(name: "Christina")

Entry.create(entry: "I had a good morning!", user: christina, journal: personal, emotion: 'joy', journal_name: personal.name, created_on: Time.now)
Entry.create(entry: "I did yoga today.", user: allene, journal: activity, emotion: 'joy', journal_name: activity.name,  created_on: Time.now)
Entry.create(entry: "I worked on the project.", user: christina, journal: work, emotion: 'joy', journal_name: work.name,  created_on: Time.now)
Entry.create(entry: "I look forward to eating dinner.", user: allene, journal: personal, emotion: 'joy', journal_name: personal.name,  created_on: Time.now)

