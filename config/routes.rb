Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'brands#index'
  patch "/brands/:brand_id", to: "brands#update"
  get "/brands", to: "brands#index"
  get "/brands/new", to: "brands#new"
  get "/brands/:brand_id/packs_table_name", to: "brand_packs#index"
  post "/brands/:brand_id/packs_table_name", to: "brand_packs#create"
  get "/brands/:brand_id/packs_table_name/new", to: "brand_packs#new"
  post "/brands", to: "brands#create"
  get "/brands/:brand_id/edit", to: "brands#edit"
  get "/brands/:id", to: "brands#show"
  get "/pack_table_name", to: "packs#index"
  get "/pack_table_name/:id", to: "packs#show"
  get "/pack_table_name/:id/edit", to: "packs#edit"
  patch "/pack_table_name/:id", to: "packs#update"
  get "/brands/:brand_id/packs_table_name/alphabetize". to: "brand_packs#alphabetize"
end
