class QuestionAnswerUser < ApplicationRecord
  self.table_name = "questions_answers_users"
  belongs_to :user
  belongs_to :question
  belongs_to :answer,required: false
  validate :attempt_of_answer
  after_save :upgrade_user_level

  def upgrade_user_level
    user = self.user
    return if User::levels.keys.last == user.level
    total_questions_for_category = Question.for_category(user.level)
    correct_answers = user.attempted_answers.where("questions_answers_users.question_id IN (?)",total_questions_for_category.pluck(:id)).correct_answers
    percentage_of_correct_questions = correct_answers.count.to_f/total_questions_for_category.count.to_f
    user.update_attribute("level", User.levels[user.level] + 1) if percentage_of_correct_questions >= 0.5
  end
  
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