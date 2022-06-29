# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "nadeem",email: "abc@example.com", password: "112333",role: 1)

User.create(name: "Hassan",email: "sxy@example.com", role: 2, password: "112331")

User.create(name: "Waleed",email: "123@example.com", role: 2, password: "112332")

User.create(name: "Anjum",email: "xyz@example.com",  password: "112332",role: 1)


Project.create(title: "Feedback Control System", description: "Project is based on the feedback control system")
Project.create(title: "Feedback Control System1", description: "Project is based on the feedback control system1")
Project.create(title: "Feedback Control System2", description: "Project is based on the feedback control system2")
