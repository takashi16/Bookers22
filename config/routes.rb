Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  root "root#top"
  # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
end

