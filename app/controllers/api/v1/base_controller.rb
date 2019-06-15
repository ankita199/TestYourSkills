class Api::V1::BaseController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :bad_record

  protected

  def bad_record
    render json: { result: { messages: "No record found",rstatus: 0, errorcode: 401}}
  end

  def parameter_errors
    render json: { result: { messages: "You have supplied invalid parameter list",rstatus: 0, errorcode: 401}}
  end
end