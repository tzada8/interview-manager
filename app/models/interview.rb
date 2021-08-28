class Interview < ApplicationRecord
   # Interview must be categorized in one of the following groups
   INDUSTRIES = ["Technology", "Sales", "Finance", "Arts and Entertainment", "Media", "Food Services", "Law Enforcement", "Health", "Research", "Education", "Manufacturing", "Management", "Other"]

   belongs_to :user
   has_many :questions, dependent: :destroy
   has_and_belongs_to_many :generics

   validates_presence_of :position
   validates_presence_of :company
   validates_presence_of :date
   validates_presence_of :duration
   validates_presence_of :interviewer
   validates_presence_of :industry
   validates_length_of :position, maximum: 100
   validates_length_of :company, maximum: 100
   validates_length_of :interviewer, maximum: 100
   validates_length_of :industry, maximum: 100
   # Interview has to be at least 1 minute long, and is set to at most 480min = 6h long
   validates_numericality_of :duration, only_integer: true, greater_than: 0, less_than_or_equal_to: 480
   validates :industry, inclusion: INDUSTRIES
end
