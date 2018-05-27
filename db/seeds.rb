# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando categorias"

categories = [ "Categoria 1" ,
               "Categoria 2",
               "Categoria 3",
               "Categoria 4",
               "Categoria 5"]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts "Categorias: OK"

Admin.create!(name: "Admin Master", email: "admin@admin.com", password: "admin123", password_confirmation: "admin123", role: 0)


10.times do |n|
  Member.create!(
    name: "Member#{n+1}",
    email: "member-#{n+1}@member.com",
    address: "Member addr #{n+1}",
    birthday: DateTime.new(2012, 8, n+1),
    phone1: "0#{n+1}",
    phone2: "1#{n+1}",
    phone3: "2#{n+1}",
    level: n+1,
    indicator: n+1,
    password: "123456",
    password_confirmation: "123456"
  )
end
