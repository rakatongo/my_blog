namespace :db do
	desc "Llenar la db con post"
	task llenar: :environment do
		Rake::Task['db:reset'].invoke
		user = User.create(name: "Daniel A. Dominguez", email: "danielfromarg@gmail.com")
		user.password = "alejandro321"
		user.authenticate(user.password)
		user.save
		15.times do
			post = user.posts.create(title: Faker::Lorem.sentence(rand(5)+1).delete("."),
				content: Faker::Lorem.paragraph(rand(120)+1))
			(rand(15) + 1).times do
				post.comments.create(email: Faker::Internet.email, 
					name: Faker::Name.name, content: Faker::Lorem.paragraph(rand(10)+1))	
			end			
		end		
	end
end