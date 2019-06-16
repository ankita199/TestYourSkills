class QuestionsAnswersUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_answers_users do |t|
      t.belongs_to :answer, index: true
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
    end
  end
end
