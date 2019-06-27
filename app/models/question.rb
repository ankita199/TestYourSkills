class Question < ApplicationRecord
  enum category: [ :easy, :medium, :hard ] 
  belongs_to :chapter
  has_many :answers
  has_many :attempts,class_name: "QuestionAnswerUser"
  has_many :users,through: :attempts,foreign_key: "user_id"
  scope :attempted_questions, -> (user_id) { left_outer_joins(:attempts).where("user_id = ?",user_id) }
  scope :skipped_questions, -> (user_id) { left_outer_joins(:attempts).where("user_id = ? AND answer_id IS NULL",user_id) }
  
  class << self
    def for_category(category)
      categories = []
      Question::categories.each do |key,value|
        categories << key
        break if key == category
      end
      where(category: categories)
    end
 
    def unattempted_questions(obj,user)
      questions = Question.for_category(user.level)
      qids = user.attempted_questions.pluck(:question_id)
      qids << obj.questions.pluck(:id) unless obj.nil?
      questions.where.not(id: qids.flatten)
    end
 end
end