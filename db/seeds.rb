# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized = open(url).read

# p serialized

json_data = JSON.parse(serialized)

Ingredient.destroy_all

json_data["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Created #{Ingredient.count} ingredients"
