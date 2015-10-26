# == Route Map
#
#                               Prefix Verb   URI Pattern                                                                    Controller#Action
#                    new_admin_session GET    /login(.:format)                                                               admins/sessions#new
#                        admin_session POST   /login(.:format)                                                               admins/sessions#create
#                destroy_admin_session DELETE /logout(.:format)                                                              admins/sessions#destroy
#                                 root GET    /                                                                              static_pages#home
#     section_costume_costume_variants GET    /sections/:section_id/costumes/:costume_id/costume_variants(.:format)          costume_variants#index
#                                      POST   /sections/:section_id/costumes/:costume_id/costume_variants(.:format)          costume_variants#create
#  new_section_costume_costume_variant GET    /sections/:section_id/costumes/:costume_id/costume_variants/new(.:format)      costume_variants#new
# edit_section_costume_costume_variant GET    /sections/:section_id/costumes/:costume_id/costume_variants/:id/edit(.:format) costume_variants#edit
#      section_costume_costume_variant GET    /sections/:section_id/costumes/:costume_id/costume_variants/:id(.:format)      costume_variants#show
#                                      PATCH  /sections/:section_id/costumes/:costume_id/costume_variants/:id(.:format)      costume_variants#update
#                                      PUT    /sections/:section_id/costumes/:costume_id/costume_variants/:id(.:format)      costume_variants#update
#                                      DELETE /sections/:section_id/costumes/:costume_id/costume_variants/:id(.:format)      costume_variants#destroy
#                     section_costumes GET    /sections/:section_id/costumes(.:format)                                       costumes#index
#                                      POST   /sections/:section_id/costumes(.:format)                                       costumes#create
#                  new_section_costume GET    /sections/:section_id/costumes/new(.:format)                                   costumes#new
#                 edit_section_costume GET    /sections/:section_id/costumes/:id/edit(.:format)                              costumes#edit
#                      section_costume GET    /sections/:section_id/costumes/:id(.:format)                                   costumes#show
#                                      PATCH  /sections/:section_id/costumes/:id(.:format)                                   costumes#update
#                                      PUT    /sections/:section_id/costumes/:id(.:format)                                   costumes#update
#                                      DELETE /sections/:section_id/costumes/:id(.:format)                                   costumes#destroy
#                             sections GET    /sections(.:format)                                                            sections#index
#                                      POST   /sections(.:format)                                                            sections#create
#                          new_section GET    /sections/new(.:format)                                                        sections#new
#                         edit_section GET    /sections/:id/edit(.:format)                                                   sections#edit
#                              section GET    /sections/:id(.:format)                                                        sections#show
#                                      PATCH  /sections/:id(.:format)                                                        sections#update
#                                      PUT    /sections/:id(.:format)                                                        sections#update
#                                      DELETE /sections/:id(.:format)                                                        sections#destroy
#                           refile_app        /attachments                                                                   #<Refile::App app_file="/home/jarrod/.rvm/gems/ruby-2.2.1/gems/refile-0.6.1/lib/refile/app.rb">
#

Rails.application.routes.draw do
  devise_for :admins,
             controllers: {
                sessions: 'admins/sessions'
             },
             path: '/',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout'
             }

  root 'static_pages#home'

  resources :sections do
    resources :costumes do
      resources :costume_variants
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
