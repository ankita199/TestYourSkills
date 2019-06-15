class QuestionAnswerUser < ApplicationRecord
    self.table_name = "questions_answers_users"
    belongs_to :user
    belongs_to :question
    belongs_to :answer,required: false
    validates :user_id,uniqueness: { scope: :question_id,message: "has already attempted this question." }, if: Proc.new { |a| a.answer_id.blank? }
    validates :user_id,uniqueness: { scope: [:question_id,:answer_id],message: "has already answer this question." }, unless: Proc.new { |a| a.answer_id.blank? }
end