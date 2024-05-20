class FinalAssessmentForSlowLearner < ApplicationRecord
  belongs_to :user ,dependent: :destroy
end
