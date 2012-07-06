Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :shops, :path => '' do
    resources :shops do
      collection do
        post :create_asset
      end
    end
  end  

  # Admin routes
  namespace :shops, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :shops, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
