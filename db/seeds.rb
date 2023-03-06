puts "🌱 Seeding spices..."

# Seed your database here

50.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

# u1 = User.create(name: "marc", email: "marc@gmail.com", password: "1234567890")
# u2 = User.create(name: "john", email: "john@gmail.com", password: "1234567890")
# u3 = User.create(name: "alex", email: "alex@gmail.com", password: "1234567890")
# u4 = User.create(name: "Helene", email: "helene@gmail.com", password: "1234567890")
# u5 = User.create(name: "Joshoua", email: "Joshoua123@gmail.com", password: "1234567890")

50.times do
    Category.create(category: Faker::Lorem.sentence(word_count: 5))
end
# c1 = Category.create(category: "Phone Bills")
# c2 = Category.create(category: "Vet Bills")
# c3 = Category.create(category: "House Keeping")
# c4 = Category.create(category: "Car Maintenance")

s1 = Status.create(status: "Done")
s1 = Status.create(status: "In Progress")
s1 = Status.create(status: "Hold")

50.times do
    
end

t1 = u1.todos.create(title: "one", content: "content one")
t2 = u1.todos.create(title: "two", content: "content two")
t3 = u1.todos.create(title: "three", content: "content three")


# t1 = Todo.create(title: "prova 4", content: "content 4", status: true)
# t1 = Todo.create(title: "prova 5", content: "content 5", status: false)

u1.categories << c1
puts "✅ Done seeding!"
