module ModelHelpers
  def valid_survey_response(attrs = {})
    SurveyResponse.new({:person_name => 'Austin Schneider'}.merge(attrs))
  end
end

RSpec.configure do |config|
  config.include ModelHelpers
end