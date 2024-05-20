class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :submit]
  before_action :check_quiz_submission, only: [:show]

  def show
    @quiz_questions = Quiz.all
  end

  def submit
    @quiz_questions = Quiz.all
    @user_answers = params[:answers]
    @score = calculate_score(@user_answers)

    # Mark the quiz as submitted for the current user
    current_user.update(submitted_quiz: true)

    if @score > 5
      current_user.update(learner_type: 'fast')
      render 'fast_learner'
    else
      current_user.update(learner_type: 'slow')
      render 'slow_learner'
    end
  end

  private

  def calculate_score(user_answers)
    total_score = 0

    user_answers.each do |question_id, user_answer|
      question = Quiz.find(question_id.to_i)
      correct_answer = question.answer

      # Check if the user's answer is correct and increment the score
      total_score += 1 if user_answer == correct_answer
    end

    total_score
  end

  def check_quiz_submission
    # Redirect to the appropriate learner page based on user's learner_type attribute
    if current_user.submitted_quiz? && current_user.learner_type == 'fast'
      render 'fast_learner'
    elsif current_user.submitted_quiz? && current_user.learner_type == 'slow'
      render 'slow_learner'
    end
  end

end
