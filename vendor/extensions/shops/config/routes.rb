Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :shops, :path => '' do
    resources :shops do
    end
  end  

  
#  get "/shops(.:format)" => "refinery/shops/shops#index"
#  get "/shops/new(.:format)" =>  "refinery/shops/shops#new" 
#  post "/shops(.:format)" => "refinery/shops/shops#create"
#  get "/shops/:id/edit(.:format)" => "refinery/shops/shops#edit"
#  get "/shop/:id(.:format)" => "refinery/shops/shops#show"
#  put "/shops/:id(.:format)" => "refinery/shops/shops#update"
#  delete  "/shops/:id(.:format)" => "refinery/shops/shops#destroy"

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
