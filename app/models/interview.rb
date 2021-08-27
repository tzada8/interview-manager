class Interview < ApplicationRecord
   has_many :questions
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
end
