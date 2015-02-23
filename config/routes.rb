Rails.application.routes.draw do
   
  resources :words

  # default route to show basic angular stuff
  root 'angular#simple'

  get 'angular/simple'

  get 'chart/scatterplot'

end
