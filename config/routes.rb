Rails.application.routes.draw do
  namespace :api, defaults: {:format => 'json'} do
    scope :module => :v1 do
      namespace :test_your_skills do
        resources :exams, only: [] do
          collection do
            get :answer_particular_question
            get :random_questions
            get :result
          end
        end
      end
    end
  end
end
