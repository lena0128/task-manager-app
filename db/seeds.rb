# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{username: "Joyce13", email: "joyce@email.com", password: "password"}])

Bucket.create([{name: "Joyce's B Party", description: "This is a list for Joyce's 9 years old birthday party preparation.", status: "In Progress", quantity: 6}])
