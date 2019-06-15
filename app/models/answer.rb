class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :users
  default_scope { order(order: :asc) }
end
