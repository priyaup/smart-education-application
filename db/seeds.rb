# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do

# db/seeds.rb

Quiz.create(question: '1) What is the result of 5 + 3?', answer: 'B) 8', options: ['A) 7', 'B) 8', 'C) 9', 'D) 10'])
Quiz.create(question: '2) If x = 4 and y = 2, what is the value of x * y?', answer: 'D) 12', options: ['A) 6', 'B) 8', 'C) 10', 'D) 12'])
Quiz.create(question: '3) What is the area of a rectangle with length 6 units and width 4 units?', answer: 'B) 16 square units', options: ['A) 8 square units', 'B) 16 square units', 'C) 20 square units', 'D) 24 square units'])
Quiz.create(question: '4) Solve for y in the equation 2y + 7 = 15.', answer: 'C) 5', options: ['A) 3', 'B) 4', 'C) 5', 'D) 6'])
Quiz.create(question: '5) If a triangle has angles measuring 30°, 60°, and 90°, what type of triangle is it?', answer: 'D) Right-angled', options: ['A) Equilateral', 'B) Isosceles', 'C) Scalene', 'D) Right-angled'])
Quiz.create(question: '6) What is the square root of 25?', answer: 'B) 5', options: ['A) 4', 'B) 5', 'C) 6', 'D) 7'])
Quiz.create(question: '7) If a circle has a radius of 3 units, what is its circumference? (Use π ≈ 3.14)', answer: 'C) 18.84 units', options: ['A) 6.28 units', 'B) 9.42 units', 'C) 18.84 units', 'D) 28.26 units'])
Quiz.create(question: '8) What is the product of 7 * 9?', answer: 'B) 63', options: ['A) 56', 'B) 63', 'C) 72', 'D) 81'])
Quiz.create(question: '9) Simplify the expression 3 + 2 * 4.', answer: 'C) 11', options: ['A) 20', 'B) 15', 'C) 11', 'D) 14'])
Quiz.create(question: '10) If a = 2 and b = 3, what is the value of a^2 + b^2?', answer: 'D) 13', options: ['A) 5', 'B) 7', 'C) 10', 'D) 13'])

TestQuestion.create(
  question: "1)What is the result of 5 + 3?",
  options: ['A) 7', 'B) 8', 'C) 9', 'D) 10'],
  correct_option: 'B) 8'
)

TestQuestion.create(
  question: "2)Which planet is known as the Red Planet?",
  options: ["A)Earth", "B) Mars", "C) Venus", "D) Jupiter"],
  correct_option: "B) Mars"
)

TestQuestion.create(
  question: "3)Who is the author of 'Pride and Prejudice'?",
  options: ["A) Charles Dickens", "B) Jane Austen", "C) William Shakespeare", "D) Mark Twain"],
  correct_option: "B) Jane Austen"
)

end