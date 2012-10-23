class SurveyResponsesController < ApplicationController
  def new
    @survey_response = SurveyResponse.new
  end

  def create
    @survey_response = SurveyResponse.new params[:survey_response]
    if @survey_response.save
      redirect_to survey_response_questions_url(@survey_response)
    else
      render :new
    end
  end

  def update
    @survey_response = SurveyResponse.find params[:id]
    if @survey_response.update_attributes(params[:survey_response])
      redirect_to survey_response_results_url(@survey_response)
    else
      render 'questions/show'
    end
  end
end