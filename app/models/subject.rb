class Subject < ApplicationRecord
   belongs_to :exam
   has_many :topics
   has_many :questions,through: :topics
end
