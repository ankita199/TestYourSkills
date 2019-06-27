class Api::V1::TestYourSkills::ExamsController < Api::V1::BaseController
  swagger_controller :exams, "Exam[answer_particular_question/random_questions/result]"

  swagger_api :answer_particular_question do
    summary "Answer Particular Question"
    param :query, "uid", :string, :required, "User Id"
    param :query, "qid", :string, :required, "Question Id"
    param :query, "aid", :string, :optional, "Answer id"

    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  def answer_particular_question
    respond_to do |format|
      if params[:qid] && params[:uid]
        question = Question.find_by_id(params[:qid])
        user = User.find_by_id(params[:uid])
        if params[:aid].present?
          answer = question.answers.find_by_id(params[:aid])
          unless answer
            format.json { render json: { result: { messages: "Invalid Answer", rstatus: 1, errorcode: 404}} }
          end
          attempt_of_question = user.attempt_of_questions.build(question_id: params[:qid],answer_id: params[:aid])
        else
          attempt_of_question = user.attempt_of_questions.build(question_id: params[:qid],answer_id: "")
        end
        if attempt_of_question 
          if attempt_of_question.valid?
            attempt_of_question.save
            format.json { render json: { result: { messages: "Success", rstatus: 0, errorcode: 200}} }
          else
            format.json { render json: { result: { messages: attempt_of_question.errors.full_messages, rstatus: 0, errorcode: 404}} }
          end
        end
      else
        parameter_errors
      end
    end
  end
  
  swagger_api :random_questions do
    summary "Get Random Questions"
    param :query, "uid", :string, :required, "User Id"
    param :query, "eid", :string, :optional, "Exam Id"
    param :query, "sid", :string, :optional, "Subject Id"
    param :query, "tid", :string, :optional, "Topic Id"
    param :query, "cid", :string, :optional, "Chapter Id"

    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  def random_questions
    if params[:uid]
      user = User.find(params[:uid])
      if user
        if params[:eid]
          obj = Exam.find_by_id(params[:eid])
        elsif params[:sid]
          obj = Subject.find_by_id(params[:sid])
        elsif params[:sid]
          obj = Topic.find_by_id(params[:tid])
        elsif params[:cid]
          obj = Chapter.find_by_id(params[:cid])
        end
        questions_list = Question.unattempted_questions(obj,user)
        if questions_list.blank?
          questions_list = Question.skipped_questions(params[:uid])
        end
        render json: { result: { messages: "success", rstatus: 1, errorcode: 200 },data: questions_list.as_json(except: [:created_at, :updated_at], include: { answers: { except: [:question_id,:created_at,:updated_at] } } )}
      end
    else
      parameter_errors
    end
  end
  
   swagger_api :result do
    summary "Get Result"
    param :query, "uid", :string, :required, "User Id"
    param :query, "eid", :string, :optional, "Exam Id"
    param :query, "sid", :string, :optional, "Subject Id"
    param :query, "tid", :string, :optional, "Topic Id"
    param :query, "cid", :string, :optional, "Chapter Id"

    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  def result
    user = User.find_by_id(params[:uid])
    if params[:uid]
      if params[:eid]
        obj = Exam.find_by_id(params[:eid])
      elsif params[:sid]
        obj = Subject.find_by_id(params[:sid])
      elsif params[:tid]
        obj = Topic.find_by_id(params[:tid])
      elsif params[:cid]
        obj = Chapter.find_by_id(params[:cid])
      end
      if obj
        all_questions = obj.questions
        all_questions_count = all_questions.count
        attempted_count = (all_questions.attempted_questions(params[:uid]).count)
        unseen_percentage = ((all_questions.unattempted_questions(user).count) / all_questions_count.to_f) * 100
        skipped_percentage = ((all_questions.skipped_questions(params[:uid]).count) / all_questions_count.to_f) * 100
        attempted_answers  = user.attempted_answers
        wrong_ans_percentage = ((attempted_answers.wrong_answers.count) / attempted_answers.count.to_f)  * 100
        correct_ans_percentage = ((attempted_answers.correct_answers.count) / attempted_answers.count.to_f) * 100
        render json: { result: { messages: "success", rstatus: 1, errorcode: 200 },data: {total_questions: all_questions_count,unseen_questions: unseen_percentage,skipped_questions: skipped_percentage,wrong_answers: wrong_ans_percentage,correct_answers: correct_ans_percentage } }
      else
        render json: { result: { messages: "Record Not Found", rstatus: 0, errorcode: 101 } }
      end
    else
      parameter_errors
    end
  end
end