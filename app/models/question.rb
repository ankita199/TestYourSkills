class Question < ApplicationRecord
  enum category: [ :easy, :medium, :hard ] 
  belongs_to :chapter
  has_many :answers
  has_many :attempts,class_name: "QuestionAnswerUser"
  has_many :users,through: :attempts,foreign_key: "user_id"
  scope :attempted_questions, -> (user_id) { left_outer_joins(:attempts).where("user_id = ?",user_id) }
  scope :unattempted_questions, -> (user_id) { left_outer_joins(:attempts).where("user_id IS NULL") }
  scope :skipped_questions, -> (user_id) { left_outer_joins(:attempts).where("user_id = ? AND answer_id IS NULL",user_id) }
end