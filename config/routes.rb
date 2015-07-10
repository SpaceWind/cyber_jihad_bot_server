BattleFiftos::Application.routes.draw do
  resources :h_descriptors

  resources :user_x_heros

  resources :active_keys

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'signup' => 'infoapi#signup_invite'
  get 'login' => 'infoapi#login'
  get 'userExists' => 'infoapi#userExists'
  get 'ping' => 'infoapi#ping'
  get 'invites' => 'infoapi#generate_invite'
  
  get 'admin/promote' => 'admin_api#promote'
  get 'admin/check'	=> 'admin_api#check'
  
  get 'party/create' => 'party_api#createParty'
  get 'party/join' => 'party_api#joinParty'
  get 'party/leave' => 'party_api#leaveParty'
  get 'party/status' => 'party_api#changeStatus'
  get 'party/message' => 'party_api#sendMessage'
  get 'party/params' => 'party_api#savePartyParams'
  
  get 'party/acc/create' => 'party_api#addAccount'
  get 'party/acc/remove' => 'party_api#removeAccount'
  get 'party/acc/ban' => 'party_api#markBanned'
  get 'party/acc/unban' => 'party_api#removeBanned'
  get 'party/acc/banned' => 'party_api#banned'
  get 'party/acc/list' => 'party_api#getAccounts'
  
  
  
  get 'party/start' => 'party_api#startParty'
  get 'party/stop' => 'party_api#stopParty'
  get 'party/update' => 'party_api#updateParty'
  get 'create_spam_list' => 'party_api#createSpamList'
  get 'append_spam_list' => 'party_api#appendSpamList'
  get 'remove_spam_list' => 'party_api#removeSpamItem'
  get 'clean_spam_list' => 'party_api#cleanSpamList'
  
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
