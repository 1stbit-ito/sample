# development.rb
set :stage, :development
set :unicorn_rack_env, "development"
set :branch, 'master'
set :rails_env, 'development'
set :migration_role, 'db'
 
role :app, %w{rails@172.31.25.8} # 実際のサーバのIPアドレスを指定します。
role :web, %w{rails@172.31.25.8}
role :db, %w{rails@172.31.25.8}
 
set :ssh_options, {
keys: [File.expand_path('~/.ssh/id_rsa')],
forward_agent: true,
auth_methods: %w(publickey)
}
 
server '172.31.25.8', user: 'rails', roles: %w{web app db}
