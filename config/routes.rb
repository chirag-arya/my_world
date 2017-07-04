Rails.application.routes.draw do
  # root :to => "video_rooms#index"
  resources :video_rooms
  match '/party/:id', :to => "video_rooms#party", :as => :party, :via => :get

  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
	root 'chat_rooms#index' #unable from somewhere

  namespace :user do
    resources :profiles
  end

	mount ActionCable.server => '/cable'
end
