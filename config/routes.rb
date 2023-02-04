Rails.application.routes.draw do
  get 'book/books'
  get 'book/new'
  get 'book/create'
  get 'book/index'
  get 'book/show'
  get 'book/edit'
  #get 'homes/top'
  root to:'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
