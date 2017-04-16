Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  root to: "dashboard#index"
  namespace :manager do
  	resources :requirements do 
  	collection do
      post :assign
    end
  end
  end

  namespace :recruiter do
  	resources :requirements
  end
  		
end
