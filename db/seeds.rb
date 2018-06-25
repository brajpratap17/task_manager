# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(name: "Admin A", email: "admin@taskmanager.com", type: "Admin", password: "Admin@123")
Developer.create!(name: "Developer A", email: "developer_A@taskmanager.com", type: "Developer", password: "DeveloperA@123")
Developer.create!(name: "Developer B", email: "developer_B@taskmanager.com", type: "Developer", password: "DeveloperB@123")
Developer.create!(name: "Developer C", email: "developer_C@taskmanager.com", type: "Developer", password: "DeveloperC@123")
Developer.create!(name: "Developer D", email: "developer_D@taskmanager.com", type: "Developer", password: "DeveloperD@123")
Developer.create!(name: "Developer E", email: "developer_E@taskmanager.com", type: "Developer", password: "DeveloperE@123")