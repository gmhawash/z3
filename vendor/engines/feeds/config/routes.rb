::Refinery::Application.routes.draw do
  resources :feeds, :only => [:index, :create, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :feeds, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
