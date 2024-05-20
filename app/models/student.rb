class Student < ApplicationRecord
  require 'faker'
  validates :first_name, :middle_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :father_name, :date_of_birth, :class_name, :blood_group, :address, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def dob
    "#{date_of_birth}"
  end

  def age
    if date_of_birth.present?
      now = Time.now.utc.to_date
      now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
    end
  end

  has_many :syllabuses

  has_one_attached :image
end
