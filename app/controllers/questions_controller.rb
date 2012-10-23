class QuestionsController < ApplicationController
  def show
    @survey_response = SurveyResponse.find(params[:survey_response_id])
  end
end