class SurveyResponse < ActiveRecord::Base
  validates :person_name, :presence => true
  validate :validate_min_price_is_not_greater_than_max_price

  def games
    games = Game.where(:platform_id => platform_id, :genre_id => genre_id)
    games = games.where 'price >= ?', min_price if min_price
    games = games.where 'price <= ?', max_price if max_price
    games.all
  end

  private

  def validate_min_price_is_not_greater_than_max_price
    if min_price && max_price && min_price > max_price
      errors.add :min_price, "can't be greater than Max. price"
    end
  end
end