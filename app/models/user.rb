class User < ApplicationRecord
  has_many :interviews
  has_many :questions

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of :first_name, maximum: 50
  validates_length_of :last_name, maximum: 50

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Gets all users interviews as a nested array to easily use in a dropdown menu
  def interviews_to_nested_array
    nested = []  
    interviews.order(:company, :position, :industry, :date).each do |interview|
      nested.push ["#{interview.company}, #{interview.position}", interview.id]
    end
    return nested 
  end
  
  # Get all user's Interviews (sorted company, position, industry, date)
  def get_interviews
    return interviews.order(:company, :position, :industry, :date)
  end

  # Get all user's Generic questions
  def get_generics
    return get_type_questions("generics")
  end

  # Get all user's Specific questions
  def get_specifics
    return get_type_questions("specifics")
  end

  # Get all user's Own questions
  def get_my_questions
    return get_type_questions("my_questions")
  end

  private
    # General private method to get ordered category of questions (sorted prompt, answer)
    def get_type_questions(other_relation)
      return questions.from("questions, " + other_relation).where(other_relation + ".question_id = questions.id").order(:prompt, :answer)
    end
end
