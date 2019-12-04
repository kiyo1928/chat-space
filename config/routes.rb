Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
  resources :messages, only: [:index, :create]

    # namespaceを利用したコントローラーのルーティング設定
    namespace :api do
      # defaultsオプションを使うことでレスポンスの形式をjsonにしている
      resources :messages, only: :index, defaults: { format: 'json'}
    end
  end
end

# devise_for :users~resorces :messagesまでのコメントアウト
  # localhost3000に接続した時にmessege#indexに接続。カリキュラムの支持からgroups#indexに記述を変更
  # usersコントローラーはeditとupdateアクションをするように指示
  # groupsコントローラーはnew,create,edit,updateアクションをするように指示


