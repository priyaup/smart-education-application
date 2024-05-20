Rails.application.routes.draw do

  get 'quiz/index'
  get 'quiz/submit'
  get 'quizzes/show'
  #this is for the test model

  get  'about' => 'about_school#index'
  get 'contact/index'
  get 'member/:id', to:'members#show', as:'member'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
  }

  resources :courses do
    member do
      post 'enroll'
    end
  end

  get '/test_questions', to: 'test_questions#index'
  resources :test_questions, only: [:index, :create,:show] do
    collection do
      post :submit
    end
  end

  root "home#index"

  resources :dashboards
  resources :students
  resources :syllabuses
  resources :blogs
  resources :blog_posts


  namespace :admin do
    resources :students
    resources :syllabuses
    resources :blogs
    resources :blog_posts
  end

   get '/quiz', to: 'quizzes#show', as: :quiz
   post '/quiz/submit', to: 'quizzes#submit'

  

end
