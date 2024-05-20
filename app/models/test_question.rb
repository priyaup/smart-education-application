class TestQuestion < ApplicationRecord
  serialize :options, Array
   belongs_to :user , dependent: :destroy
  validates :question, presence: true
  validates :options, presence: true
  validates :correct_option, presence: true
   # validates :score, presence: true
end
