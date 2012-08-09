Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :deliveries, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :deliveries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
