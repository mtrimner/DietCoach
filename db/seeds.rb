# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
    {name: "Jack Smith", email: "jacksmith@test.com", password: "111111"},
    {name: "Max Smith", email: "maxsmith@test.com", password: "111111"},
    {name: "Tony Block", email: "tonyblock@test.com", password: "111111"}
])

meals = Meal.create!([
    {name: "Salad and Pie"},
    {name: "Mashed Potatoes and Rice"},
    {name: "Turkey and Stuffing"}
])

foods = Food.create!([
    {name: "chicken salad", serving_size: 80, carbs: 20, fat: 12, protein: 28, user_id: users[0].id, meal_id: meals[0].id},
    {name: "pie", serving_size: 1200, carbs: 30, fat: 22, protein: 10, user_id: users[0].id, meal_id: meals[0].id},
    {name: "mashed potatoes", serving_size: 100, carbs: 45, fat: 5, protein: 4, user_id: users[1].id, meal_id: meals[1].id},
    {name: "fried rice", serving_size: 80, carbs: 38, fat: 5, protein: 4, user_id: users[1].id, meal_id: meals[1].id},
    {name: "Turkey", serving_size: 130, carbs: 5, fat: 9, protein: 27, user_id: users[2].id, meal_id: meals[2].id},
    {name: "stuffing", serving_size: 140, carbs: 38, fat: 9, protein: 2, user_id: users[2].id, meal_id: meals[2].id},
])