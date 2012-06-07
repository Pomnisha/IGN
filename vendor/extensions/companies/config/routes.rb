Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :companies do
    resources :companies, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :companies, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :companies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
