Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :topics do
    resources :topics do
    end
  end
  
  # Admin routes
  namespace :topics, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :topics, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
