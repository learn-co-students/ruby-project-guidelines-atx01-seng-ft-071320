#this is where our seeds will go

personal = Journal.create(name: "Personal")
work = Journal.create(name: "Work")
activity = Journal.create(name: "Activity")

allene = User.create(name: "Allene")
christina = User.create(name: "Christina")

Entry.create(entry_text: "I had a good morning!", user: christina, journal: personal)
Entry.create(entry_text: "I did yoga today.", user: allene, journal: activity)
Entry.create(entry_text: "I worked on the project.", user: christina, journal: work)
Entry.create(entry_text: "I look forward to eating dinner.", user: allene, journal: personal)

