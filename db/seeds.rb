# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name:"Music")
Category.create(name:"Sport")
Category.create(name:"Technology")

User.create(name: "user", email: "email@uc.cl", password: "holahola")

4.times do
	User.create(
							name: Faker::Name.name,
							email: Faker::Internet.unique.email,
							password: "holahola"
							)
end

6.times do
	Project.create(
									name: Faker::Commerce.product_name,
									description: Faker::Lorem.paragraph(15),
									start_date: Faker::Time.between(DateTime.now - 1, DateTime.now),
									end_date: Faker::Time.forward(365, :evening),
									user_id: User.order('RANDOM()').first.id,
									category_id: Category.order('RANDOM()').first.id)
end

6.times do
	Comment.create(
									content: Faker::Hipster.sentence,
								 	user_id: User.order('RANDOM()').first.id,
								 	project_id: Project.order('RANDOM()').first.id
								 	)
end

16.times do
	Reward.create(
								title: Faker::Hipster.sentence(2, false, 2),
								amount: Faker::Commerce.price,
								description: Faker::Hipster.sentence,
								project_id: Project.order('RANDOM()').first.id
								)
end