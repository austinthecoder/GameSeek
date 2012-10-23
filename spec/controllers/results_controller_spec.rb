require 'spec_helper'

describe ResultsController do
  describe "GET show" do
    before do
      @survey_response = valid_survey_response.tap &:save!
    end

    context "when the survey response exists" do
      it "assigns the survey response" do
        get :show, :survey_response_id => @survey_response.to_param
        expect(assigns(:survey_response)).to eq @survey_response
      end

      it "renders the show template" do
        get :show, :survey_response_id => @survey_response.to_param
        expect(response).to render_template 'show'
      end
    end

    context "when the survey response doesn't exist" do
      it "raises a record not found error" do
        expect { get :show, :survey_response_id => '239457' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end