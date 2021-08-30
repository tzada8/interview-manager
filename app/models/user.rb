class User < ApplicationRecord
  has_many :interviews
  has_many :generics
  has_many :my_questions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  # BY DEFAULT: order user's interviews alphabetically by company, then position, then industry, then date
  def sort_interviews
    return interviews.order(:company, :position, :industry, :date)
  end

  # BY DEFAULT: order user's own questions alphabetically by prompt
  def sort_my_questions
    return my_questions.order(:prompt)
  end

  # BY DEFAULT: order user's generic questions by prompt, then answer
  def sort_generics
    return generics.order(:prompt, :answer)
  end
end
