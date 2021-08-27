class Generic < ApplicationRecord
   has_and_belongs_to_many :interviews

   validates_presence_of :prompt
   validates_presence_of :answer
   validates_length_of :prompt, maximum: 4096
   validates_length_of :answer, maximum: 4096
end
