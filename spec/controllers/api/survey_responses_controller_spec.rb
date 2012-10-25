require 'spec_helper'

describe Api::SurveyResponsesController do
  describe "GET index" do
    context "when the format is json" do
      it "returns a json array of the survey responses " do
        SurveyResponse.stub(:all) { [
          double('survey response', :as_json => {:a => 1, :b => '2'}),
          double('survey response', :as_json => {:a => 2, :b => '3'})
        ] }

        get :index, :format => :json
        expect(response.status).to eq 200
        expect(response.body).to eq '[{"a":1,"b":"2"},{"a":2,"b":"3"}]'
      end
    end

    context "when the format is not json" do
      it "the response status is 406 (not acceptable)" do
        get :index
        expect(response.status).to eq 406
      end
    end
  end
end