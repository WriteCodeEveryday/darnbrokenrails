Darnbrokenrails::Application.routes.draw do
  root 'software#index'
  resources :softwares
  get '/software/unathorized' => 'software#unathorized'
  post '/software/execute' => 'software#execute_method'
  post '/software/upload' => 'software#upload_new_software_file'
  post '/software/upload_yaml' => 'software#upload_alternative_software_file'
  post '/software/upload_marshal' => 'software#upload_marshaled_software_file'
  post '/software/confirm' => 'software#confirm_software_expiration'
  match ':controller(/:action(/:id(.:format)))', :via => [:get, :post]
  # XXX This code violates the "Default Routes" portion of Brakeman.
  # This call to the method uses dangerous sends to the underlying controller.
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/default_routes/
end
