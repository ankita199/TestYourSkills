class User < ApplicationRecord
    has_many :attempt_of_questions, class_name: "QuestionAnswerUser", foreign_key: "user_id"
    has_many :attempted_questions, through: :attempt_of_questions,source: "question"
end
