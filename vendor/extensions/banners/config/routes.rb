Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :banners do
    resources :banners, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :banners, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :banners, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
