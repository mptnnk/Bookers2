# bookers2 routes
Rails.application.routes.draw do
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #get 'users/show'
  #get 'users/:id'=>'users#show'
  #get 'users/edit'
  #get 'users/index'
  #get 'book/books'
  #get 'homes/top'
  root to:'homes#top'
  get 'home/about'=>'homes#about',as:"about"
  devise_for :users

  resources:books
  resources:users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
