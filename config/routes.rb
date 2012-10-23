GameSeek::Application.routes.draw do
  root :to => 'survey_responses#new'

  resources :survey_responses, :only => [:create, :update] do
    resource :questions, :only => [:show]
    resource :results, :only => [:show]
  end
end
