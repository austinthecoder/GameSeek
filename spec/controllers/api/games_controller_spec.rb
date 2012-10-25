require 'spec_helper'

describe Api::GamesController do
  describe "DELETE destroy" do
    before { @game = Game.create! }

    context "when the game exists" do
      it "deletes the game" do
        delete :destroy, :id => @game.to_param
        expect(Game.find_by_id(@game.id)).to be_nil
      end

      it "returns 200" do
        delete :destroy, :id => @game.to_param
        expect(response.status).to eq 204
      end
    end

    context "when the game doesn't exist" do
      it "raises record not found error" do
        expect {
          delete :destroy, :id => '7283507'
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end