class TestQuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:submit]

  def index
    @test_questions = TestQuestion.all
  end

  def submit
    score = 0
    total_questions = TestQuestion.count
    params[:answers].each do |question_id, answer|
      test_question = TestQuestion.find(question_id.to_i)
      if test_question.correct_option == answer
        score += 1
      end
    end
    @score = score
    @test = current_user.test_questions.create(score: @score)
    session[:score] = @score  # Store score in session
    redirect_to test_question_path(@score)
  end

  def show
    @score = session[:score].to_i  # Retrieve score from session
    @test_questions = TestQuestion.all
  end
end
