# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Rodrigo", email: "rr@uc.cl", password: "hola")
User.create(name: "Andres", email: "aa@uc.cl", password: "hola")
User.create(name: "Lucas", email: "ll@uc.cl", password: "hola")

Project.create(name: 'p1', description: 'ahola', start_date: DateTime.new(2013), 
	end_date: DateTime.new(2014), user_id: 1)

Comment.create(content: 'holaholahola', user_id: 1, project_id: 1)