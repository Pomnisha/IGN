Refinery::Core::Engine.routes.append do


  # Admin routes
  namespace :menus, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :menus, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
