# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  100.times do |i|
  	product = Product.create(product_name:Faker::Name.name, product_price:Faker::Number.between(100, 200), selling_price:Faker::Number.between(210, 300), product_stock:Faker::Number.between(10, 30))
  end