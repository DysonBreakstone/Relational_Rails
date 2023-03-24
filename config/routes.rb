Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'brands#index'
  get "/brands", to: "brands#index"
  get "/brands/:id", to: "brands#show"
  get "/pack_table_name", to: "packs#index"
  get "/pack_table_name/:id", to: "packs#show"
  get "/brands/:brand_id/packs_table_name", to: "brand_packs#index"
end
