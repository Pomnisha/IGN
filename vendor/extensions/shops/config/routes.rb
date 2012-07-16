Refinery::Core::Engine.routes.append do

  # Frontend routes
  get '/shops/shops/my' => 'shops/shops#my', :as => 'my_shops'
  namespace :shops, :path => '' do
    resources :shops do
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
