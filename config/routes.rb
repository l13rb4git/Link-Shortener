Rails.application.routes.draw do
  get 'home/index'
 post '/links' => 'links#create'
end
