# app/models/quiz.rb
class Quiz < ApplicationRecord
  serialize :options, Array
end

