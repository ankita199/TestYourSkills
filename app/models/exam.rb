class Exam < ApplicationRecord
  has_many :subjects
  has_many :questions,through: :subjects
end