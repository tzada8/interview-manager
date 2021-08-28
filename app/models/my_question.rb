class MyQuestion < ApplicationRecord
   validates_presence_of :prompt
   validates_length_of :prompt, maximum: 4096
end
