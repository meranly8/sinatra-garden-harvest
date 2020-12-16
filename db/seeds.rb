claire = User.create(username: "clarabell", email: "clara@mail.com", password: "herbie")
shell = User.create(username: "mickshell", email: "mickshell@mail.com", password: "pompom")

claire.crops.create(name: "Corn", quantity: 20, season: "Summer", year: 2020)
claire.crops.create(name: "Strawberry", quantity: 15, season: "Summer", year: 2019)
shell.crops.create(name: "Radish", quantity: 6, season: "Spring", year: 2018)
shell.crops.create(name: "Kale", quantity: 3, season: "Spring", year: 2019)