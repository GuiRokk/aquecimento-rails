Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: 'home#index' #= #get '/', to: 'home#index'

  resources :study_items, only: [:show, :new, :create, :edit, :update] do
    patch 'mark_as_done', on: :member
  end

  resources :categories, only: [:show, :new, :create]
              #model            mostrar  form e criar  form e atualizar

end 