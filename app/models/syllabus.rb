class Syllabus < ApplicationRecord
  require 'faker'
  belongs_to :student
  has_and_belongs_to_many :users ,dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  default_scope { order(created_at: :desc) }
end
