Urbanodiccionario::Application.routes.draw do
  root to: 'words#index'
  resources :words do
    get '/up-vote', to: 'votes#up_vote', as: :up_vote
    get '/down-vote', to: 'votes#down_vote', as: :down_vote
  end
end
