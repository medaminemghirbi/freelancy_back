Rails.application.routes.draw do
  get 'payement/new'

  get 'countAllHome' , to: 'admin#countAllHome'
  
  get 'payement/create'

  resources :messages

  resources :credit_cards

  resources :sessions, only: [:create]

  resources :registrations, only: %i[create confirm_email] do
    member do
      get :confirm_email
    end
  end

  delete :logout, to: 'sessions#logout'

  get :logged_in, to: 'admin#logged_in'

  get :freelancers, to: 'admin#getallfreelancers'

  get 'client/:client_id', to: 'admin#getclientmission'

  get 'freelancer/:freelancer_id', to: 'admin#getfreelancermission'

  get 'freelancerdata/:id', to: 'admin#getfreelancerdata'

  patch 'updatecompleted/:id', to: 'requests#updatecompleted'
  delete 'deleteclient/:client_id', to: 'admin#destroyclient'

  get 'missiondata/:id', to: 'admin#getmissiondata'

  get :countall, to: 'admin#countall'

  patch '/upadateFreelancer/:id', to: 'admin#updateFreelancer'

  patch '/updateclient/:id', to: 'admin#updateclient'

  patch '/updateimagefreelancer/:id', to: 'admin#updateimagefreelancer'

  patch '/updateadmin/:id', to: 'admin#update'

  get 'clientdata/:id', to: 'admin#getclientdata'

  get 'getmissionbylanguage/:language_id', to: 'missions#getmissionbylanguage'

  get 'getmissionbycategory/:category_id', to: 'missions#getmissionbycategory'

  get 'getmissionbybudget/:budget', to: 'missions#getmissionbybudget'

  get 'getuserexperiance/:user_id', to: 'experiences#getuserexperiance'

  get 'freelancersbyrating/:reviews_count', to: 'admin#getfreelancersbyrating'

  get 'getusereducation/:user_id', to: 'educations#getusereducation'

  get 'getrequestbyfreelancer/:freelancer_id', to: 'requests#getrequestbyfreelancer'

  get 'getrequestbyclient/:client_id', to: 'requests#getrequestbyclient'

  get 'getmissionbyrequestclient/:client_id', to: 'requests#getmissionbyrequestclient'

  get 'getmissionbyfreelancer/:freelancer_id', to: 'admin#getmissionbyfreelancer'

  get 'activemission/:client_id', to: 'missions#getclientactivemission'

  get 'getendedmissionbyclient/:client_id', to: 'missions#getendedmissionbyclient'

  get 'getendedmissionbyfreelancer/:freelancer_id', to: 'missions#getendedmissionbyfreelancer'

  get 'countrequest/:mission_id', to: 'requests#countproposition'

  get 'getrequestacceptedbyclient/:client_id', to: 'requests#getrequestacceptedbyclient'

  get 'getrequestacceptedbyfreelancer/:freelancer_id', to: 'requests#getrequestacceptedbyfreelancer'

  get 'ratingfreelancer/:user_id', to: 'reviews#ratingfreelancer'

  get 'ratingclient/:user_id', to: 'reviews#ratingclient'

  get 'countAllHome', to: 'admin#countAllHome'

  get 'getfreelancerbylanguage/:language_id', to: 'admin#getfreelancerbylanguage'

  patch '/updatelanguage/:id', to: 'admin#updatelanguage'

  get '/getfreelancerlanguage/:user_id', to: 'admin#getfreelancerlanguage'

  delete 'destroylanguagefreelancer/:id', to: 'admin#destroylanguagefreelancer'

  patch '/updatefreelancerlanguages/:id', to: 'admin#updatefreelancerlanguages'

  get 'getallpayements', to: 'orders#index'

  post 'message', to: 'message#sendmessage'

  get 'getmessagebysender/:sender_id/:receiver_id', to: 'message#getmessagebysender'

  get 'getmessagebyreceiver/:receiver_id/:sender_id', to: 'message#getmessagebyreceiver'
  
  get 'countAllFreelancer/:user_id', to: 'admin#countAllFreelancer'
  
  get 'countAllClient/:client_id', to: 'admin#countAllClient'

  get :homemissions, to: 'missions#homemissions'

  resources :admin, only: %i[show create index update destroy]

  resources :missions, only: %i[create index show update destroy]

  resources :categories, only: %i[create index show update destroy]

  resources :reviews, only: %i[create index show update destroy]

  resources :educations, only: %i[create index show update destroy]

  resources :experiences, only: %i[create index show update destroy]

  resources :languages, only: %i[create index show update destroy]

  resources :requests, only: %i[create index show update destroy]

  resources :charges, only: %i[create]

  resources :password_resets

  resources :messages, only: %i[create]

  mount ActionCable.server => '/cable'

  resources :favoris, only: %i[create index destroy]

  get 'favoris/:user_id', to: 'favoris#show'

  root to: 'static#home'
end
