Rails.application.routes.draw do
  resources :ideas
  root to: "ideas#index"
end
