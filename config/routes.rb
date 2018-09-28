Rails.application.routes.draw do
  resources :reservations do
    collection do
      get 'reservation_ajax'
    end
  end
  resources :bikes do
    collection do
      get 'bike_ajax'
    end
  end
  resources :employees do
    collection do
      get 'employee_ajax'
    end
  end
end
