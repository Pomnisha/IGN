Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :subcategories do
    resources :subcategories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :subcategories, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :subcategories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
