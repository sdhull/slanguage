Slanguage::Application.routes.draw do
  devise_for :users
  root :to => "welcome#index"
  get "*foo", :to => "welcome#index"
end
