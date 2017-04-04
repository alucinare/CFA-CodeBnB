Rails.application.routes.draw do

  get 'rooms/index'

  get 'rooms/show'

  get 'rooms/new'

  get 'rooms/create'

  get 'rooms/edit'

  get 'rooms/update'

  root 'pages#home'

  devise_for :users,
             :path => '',
            #  these are the path names that are used in the url
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile' },
            #  these are for the new controllers that we created
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                              :registrations => 'registrations'
                             }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
end
