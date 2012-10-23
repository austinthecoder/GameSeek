require 'spec_helper'

describe SurveyResponsesController do
  describe "GET new" do
    it "assigns a new survey response" do
      get :new
      expect(assigns(:survey_response)).to be_a(SurveyResponse)
      expect(assigns(:survey_response)).to be_new_record
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe "POST create" do
    context "with valid params" do
      before { @params = {:survey_response => {:person_name => 'Austin Schneider', :platform_id => '2'}} }

      it "creates a survey response" do
        expect { post :create, @params }.to change { SurveyResponse.count }.by(1)
      end

      it "sets the attributes from the params" do
        post :create, @params
        survey_response = SurveyResponse.last
        expect(survey_response.person_name).to eq 'Austin Schneider'
        expect(survey_response.platform_id).to eq 2
      end

      it "redirects to the survey response's questions page" do
        post :create, @params
        expect(response).to redirect_to survey_response_questions_url(SurveyResponse.last)
      end
    end

    context "with invalid params" do
      before { SurveyResponse.any_instance.stub(:valid?) }

      it "doesn't create survey response" do
        expect { post :create, @params }.to_not change { SurveyResponse.count }
      end

      it "assigns a new survey response, with attributes from the params" do
        post :create, :survey_response => {:person_name => 'Austin Schneider', :platform_id => '2'}
        expect(assigns(:survey_response)).to be_a(SurveyResponse)
        expect(assigns(:survey_response)).to be_new_record
        expect(assigns(:survey_response).person_name).to eq 'Austin Schneider'
        expect(assigns(:survey_response).platform_id).to eq 2
      end

      it "renders the new template" do
        post :create
        expect(response).to render_template 'new'
      end
    end
  end

  describe "PUT update" do
    before do
      @survey_response = valid_survey_response(:genre_id => 1, :min_price => 10, :max_price => 50).tap &:save!
    end

    context "when the survey response exists" do
      before do
        @params = {
          :id => @survey_response.to_param,
          :survey_response => {:genre_id => '2', :min_price => '20', :max_price => '40'}
        }
      end

      it "assigns the survey response" do
        put :update, @params
        expect(assigns(:survey_response)).to eq @survey_response
      end

      context "with valid params" do
        it "updates the survey response" do
          put :update, @params
          @survey_response.reload
          expect(@survey_response.genre_id).to eq 2
          expect(@survey_response.min_price).to eq 20
          expect(@survey_response.max_price).to eq 40
        end

        it "redirects to the survey response results page" do
          put :update, @params
          expect(response).to redirect_to survey_response_results_url(@survey_response)
        end
      end

      context "with invalid params" do
        before { SurveyResponse.any_instance.stub :valid? }

        it "doesn't update the survey response" do
          put :update, @params
          @survey_response.reload
          expect(@survey_response.genre_id).to eq 1
          expect(@survey_response.min_price).to eq 10
          expect(@survey_response.max_price).to eq 50
        end

        it "renders the questions's show template" do
          put :update, @params
          expect(response).to render_template 'questions/show'
        end
      end
    end

    context "when the survey response doesn't exist" do
      it "raises a record not found error" do
        expect { put :update, :id => '239457' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end