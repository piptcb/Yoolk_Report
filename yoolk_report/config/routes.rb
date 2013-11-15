YoolkReport::Application.routes.draw do
  root "report#index"
  resources "report"
end
