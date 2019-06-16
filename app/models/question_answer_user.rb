class QuestionAnswerUser < ApplicationRecord
  self.table_name = "questions_answers_users"
  belongs_to :user
  belongs_to :question
  belongs_to :answer,required: false
  validate :attempt_of_answer

  def attempt_of_answer
    if user_id && question_id
      attempt_exists = QuestionAnswerUser.find_by(user_id: user_id,question_id: question_id)
      if attempt_exists
        if attempt_exists.answer_id
          errors.add(:base,"has already answered this question")
        elsif attempt_exists.answer_id.blank? && answer_id.present?
          attempt_exists.destroy
        elsif attempt_exists.answer_id.blank? && answer_id.blank?
          errors.add(:base,"has already skipped this question")
        end
      end
    end
  end
end