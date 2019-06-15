class Api::V1::TestYourSkills::ExamsController < Api::V1::BaseController
    
  def answer_particular_question
    if params[:qid] && params[:uid]
      question = Question.find_by_id(params[:qid])
      user = User.find_by_id(params[:uid])
      if params[:aid].present?
        answer = question.answers.find_by_id(params[:aid])
        unless answer
          render json: { result: { messages: "Invalid Answer", rstatus: 1, errorcode: 404}}
        else
          attempt_of_question = user.attempt_of_questions.build(question_id: params[:qid],answer_id: params[:aid])
        end
      else
        attempt_of_question = user.attempt_of_questions.build(question_id: params[:qid],answer_id: "")
      end
      if attempt_of_question 
        if attempt_of_question.valid?
          attempt_of_question.save
          render json: { result: { messages: "Success", rstatus: 0, errorcode: 200}}
        else
          render json: { result: { messages: attempt_of_question.errors.full_messages, rstatus: 0, errorcode: 404}}
        end
      end
    else
      parameter_errors
    end
  end
end