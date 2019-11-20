Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end

# localhost3000に接続した時にmessege#indexに接続。カリキュラムの支持からgroups#indexに記述を変更
# usersコントローラーはeditとupdateアクションをするように指示
# groupsコントローラーはnew,create,edit,updateアクションをするように指示


