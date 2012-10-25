GameSeek::Application.routes.draw do
  root :to => 'survey_responses#new'

  resources :survey_responses, :only => [:create, :update] do
    resource :questions, :only => [:show]
    resource :results, :only => [:show]
  end

  namespace :api do
    resources :survey_responses, :only => [:index]
    resources :games, :only => [:destroy]
  end
end
