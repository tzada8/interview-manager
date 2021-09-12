class Interview < ApplicationRecord
   # Interview must be categorized in one of the following groups
   INDUSTRIES = ["Technology", "Sales", "Finance", "Arts and Entertainment", "Media", "Food Services", "Law Enforcement", "Health", "Research", "Education", "Manufacturing", "Management", "Other"]

   belongs_to :user
   has_many :specifics

   validates_presence_of :company
   validates_presence_of :position
   validates_presence_of :industry
   validates_presence_of :date
   validates_presence_of :duration
   validates_presence_of :interviewer
   validates_length_of :position, maximum: 100
   validates_length_of :company, maximum: 100
   validates_length_of :interviewer, maximum: 100
   validates_length_of :industry, maximum: 100
   # Interview has to be at least 1 minute long, and is set to at most 480min = 6h long
   validates_numericality_of :duration, only_integer: true, greater_than: 0, less_than_or_equal_to: 480
   validates :industry, inclusion: INDUSTRIES

   # Get all user's specifics as Questions (sorted prompt, answer)
  def get_specifics
    return Question.from("questions, specifics").where("questions.id = specifics.question_id AND specifics.interview_id = ?", id).order(:prompt, :answer)
  end
end
