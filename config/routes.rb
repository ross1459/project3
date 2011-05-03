#config/routes.rb
Project3::Application.routes.draw do
  get "pubsurvey/index"
  match "pubsurvey/index" => "pubsurvey#index"
  match "pubsurvey/take" => "pubsurvey#take"
  match "pubsurvey/go" => "pubsurvey#go"

  get "takesurvey/index"

  get "questions/index"

  get "questions/chooseQuestion"

  get "questions/new"
  match "questions/create" => "questions#create"
  
  get "pages/login"
  match "pages/login" => "pages#login"
  match "pages/loginstatus" => "pages#loginstatus"
  get "pages/logout"
  get "pages/index"
  match "pages/index" => "pages#index"

  get "surveys/new"
  match "surveys/create" => "surveys#create"
  get "surveys/edit"

  get "surveys/index"
  match "surveys/index" => "surveys#index"
  
  get "surveys/chooseSurvey"
  match "surveys/chooseSurvey" => "surveys#chooseSurvey"
  
  get "surveys/update"
  match "surveys/update" => "surveys#update"
  
  get "surveys/edit"
  match "surveys/edit" => "surveys#edit"
  match "surveys/view" => "surveys#view"
  
  get "pages/takesurvey"
  match "pages/takesurvey" => "pages#takesurvey"
  match "pages/surveystatus" => "pages#surveystatus"

  get "users/index"
end
