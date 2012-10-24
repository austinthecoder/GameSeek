GameSeek::Application.routes.draw do
  root :to => 'survey_responses#new'

  namespace :api do
    resources :survey_responses, :only => [:index]
  end

  resources :survey_responses, :only => [:create, :update] do
    resource :questions, :only => [:show]
    resource :results, :only => [:show]
  end
end
