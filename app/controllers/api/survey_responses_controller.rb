module Api
  class SurveyResponsesController < ApplicationController
    def index
      respond_to do |format|
        format.json { render :json => SurveyResponse.all.map(&:as_json) }
      end
    end
  end
end