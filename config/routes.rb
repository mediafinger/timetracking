# this file: config/routes.rb

# http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/'             => 'sites#home'

  # shorter way of defining routes
  # also enables to use all the Rails path helpers
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :entries, only: [:index, :destroy, :new, :create]
  end

  resources :people, only: [:new, :create]

  # routes defined by hand (error prone)
  # get  '/projects/new'      => 'projects#new'
  # get  '/projects/:id'      => 'projects#show'
  # put  '/projects/:id'      => 'projects#update'
  # post '/projects'          => 'projects#create'
  # get  '/projects'          => 'projects#index'
  # get  '/projects/:id/edit' => 'projects#edit'
end
