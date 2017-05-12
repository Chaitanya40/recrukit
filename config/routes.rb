Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  root to: "dashboard#index"
  namespace :manager do
  	resources :requirements do 
      resources :submissions, only: [:show, :edit, :udpate] do
        collection do
          post :send_email
          post :add_comment
        end
      end
      collection do
        post :assign
      end  
    end  
  end

  namespace :recruiter do
  	resources :requirements do
      resources :submissions
    end   
  end
  		
end
