class User < ApplicationRecord

  # validates :contact, presence: true, format: { with: /\A\+91\d{10}\z/, message: "should be in Indian format (+91XXXXXXXXXX)" }

  # validates :Alternate_contact, presence: true, format: { with: /\A\+91\d{10}\z/, message: "should be in Indian format (+91XXXXXXXXXX)" }


  validates :first_name, presence: true, format: { with: /\A[A-Za-z]+\z/, message: "should contain only letters" }
  
  validates :last_name, presence: true, format: { with: /\A[A-Za-z]+\z/, message: "should contain only letters" }


  has_many :test_questions ,dependent: :destroy
  enum learner_type: { fast: 'fast', slow: 'slow' }
  has_and_belongs_to_many :syllabuses ,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

         
  def admin?
    role == 'admin'
  end

  def name
    "#{first_name} #{last_name}".strip
  end
  
end
