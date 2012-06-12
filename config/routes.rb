#encoding utf-8
SearchFriend::Application.routes.draw do
  root :to => 'friends#index'
  resources :friends
end
