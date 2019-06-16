class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :users
  default_scope { order(order: :asc) }
  scope :correct_answers, -> { where('is_correct = true').uniq }
  scope :wrong_answers, -> { where('is_correct = false').uniq }
end
