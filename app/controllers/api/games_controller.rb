class Api::GamesController < ApplicationController
  def destroy
    Game.find(params[:id]).destroy
    render :nothing => true, :status => 204
  end
end