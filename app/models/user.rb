class User < ApplicationRecord
  has_many :interviews
  has_many :generics
  has_many :my_questions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
