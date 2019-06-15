Rails.application.routes.draw do
  namespace :api, defaults: {:format => 'json'} do
    scope :module => :v1 do
      namespace :test_your_skills do
        get  'answer_particular_question' => 'exams#answer_particular_question', as: :answer_particular_question
        get  'random_questions' => 'exams#random_questions', as: :random_questions
      end
    end
  end
end
