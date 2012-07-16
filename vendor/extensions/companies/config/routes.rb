Refinery::Core::Engine.routes.append do

  # Frontend routes
  match '/companies/companies/my' => 'companies/companies#my', :as => 'my_companies'  
  namespace :companies, :path => '' do
    resources :companies do
      collection do
        post :create_asset
      end
    end
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

