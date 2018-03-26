Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :posts

	resources :books

	resources :users, only:[:index, :show, :edit, :update]
  root "root#top"
  get "/home/about" => "root#about"

  # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
end

