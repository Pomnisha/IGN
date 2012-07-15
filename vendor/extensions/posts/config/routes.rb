Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :posts do
    resources :posts do 
    end
  end

  # Admin routes
  namespace :posts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :posts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
