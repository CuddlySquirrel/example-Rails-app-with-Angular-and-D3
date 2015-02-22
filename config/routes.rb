Rails.application.routes.draw do
   
  resources :words

  # default route to show basic angular stuff
  root 'angular#simple'


  # dynamic routes = less typing
  get ':controller/(:action)'

end
