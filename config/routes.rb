Rails.application.routes.draw do
  root 'sessions#new' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
      get :bookmarks
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
