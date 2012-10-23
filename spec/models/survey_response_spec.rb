require 'spec_helper'

describe SurveyResponse do
  it "person_name is required" do
    expect(valid_survey_response :person_name => nil).to be_invalid
    expect(valid_survey_response :person_name => ' ').to be_invalid
  end

  it "min_price can't be greater than max_price" do
    expect(valid_survey_response :min_price => 50, :max_price => 51).to be_valid
    expect(valid_survey_response :min_price => 50, :max_price => 50).to be_valid
    expect(valid_survey_response :min_price => nil, :max_price => 49).to be_valid
    expect(valid_survey_response :min_price => 50, :max_price => nil).to be_valid
    expect(valid_survey_response :min_price => nil, :max_price => nil).to be_valid
    expect(valid_survey_response :min_price => 50, :max_price => 49).to be_invalid
  end

  describe "games" do
    before do
      @game1 = Game.create! :platform_id => 1, :genre_id => 1, :price => 29
      @game2 = Game.create! :platform_id => 1, :genre_id => 1, :price => 30
      @game3 = Game.create! :platform_id => 1, :genre_id => 1, :price => 40
      @game4 = Game.create! :platform_id => 1, :genre_id => 1, :price => 50
      @game5 = Game.create! :platform_id => 1, :genre_id => 1, :price => 51
      @game6 = Game.create! :platform_id => 1, :genre_id => 2, :price => 40
      @game7 = Game.create! :platform_id => 2, :genre_id => 1, :price => 40

      @survey_response = valid_survey_response :platform_id => 1, :genre_id => 1, :min_price => 30, :max_price => 50
    end

    context "with a min_price and max_price" do
      it "is the games for the survey response's platform, genre and price range" do
        expect(@survey_response.games).to match_array [@game2, @game3, @game4]
      end
    end

    context "without a min_price" do
      it "only excludes the games whose price is higher than the max_price" do
        @survey_response.min_price = nil
        expect(@survey_response.games).to match_array [@game1, @game2, @game3, @game4]
      end
    end

    context "without a min_price" do
      it "only excludes the games whose price is lower than the min_price" do
        @survey_response.max_price = nil
        expect(@survey_response.games).to match_array [@game2, @game3, @game4, @game5]
      end
    end

    context "without a platform_id" do
      it "doesn't return any games" do
        @survey_response.platform_id = nil
        expect(@survey_response.games).to eq []
      end
    end

    context "without a genre_id" do
      it "doesn't return any games" do
        @survey_response.genre_id = nil
        expect(@survey_response.games).to eq []
      end
    end
  end
end