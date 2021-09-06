class Question < ApplicationRecord
  belongs_to :user
  has_many :specifics
  has_many :generics
  has_many :my_questions
 
  validates_presence_of :prompt
  validates_length_of :prompt, maximum: 4096
  validates_length_of :answer, maximum: 4096

  def self.search(query, exact, user_questions)
    if query.nil?  # Nothing to search by, so return everything of users
      return user_questions
    else # Else specific search criteria given, so use it to filter
      if exact.nil? # Don't search for exact match
        query = "%" + query.upcase + "%"
        return user_questions.where("UPPER(prompt) LIKE ? OR UPPER(answer) LIKE ?", query, query)
      else # Search for exact match
        query = "%" + query + "%"
        return user_questions.where("prompt LIKE ? OR answer LIKE ?", query, query)
      end
    end
  end

  # Check if a question is only a specific one to know whether question can be entirely deleted, or if only "reference to specific" should be delete
  def is_only_specific?
    specifics.count == 0 or generics.count == 0
  end
end
