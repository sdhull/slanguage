Slanguage::Application.routes.draw do
  root :to => "welcome#index"
  get "*foo", :to => "welcome#index"
end
