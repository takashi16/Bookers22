Rails.application.routes.draw do
  devise_for :users
	resources :posts

	resources :books

	resources :users, only:[:index, :show, :edit, :update]
  root "root#top"
  get "/home/about" => "root#about"

  # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
end

