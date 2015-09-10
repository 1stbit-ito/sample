# staging.rb
set :stage, :staging
set :unicorn_rack_env, "staging"
set :branch, 'master'
set :rails_env, 'staging'
set :migration_role, 'db'
 
role :app, %w{rails@172.31.24.164 rails@172.31.6.15} # 実際のサーバのIPアドレスを指定します。
role :web, %w{rails@172.31.24.164 rails@172.31.6.15}
role :db, %w{rails@172.31.24.164 rails@172.31.6.15}
 
set :ssh_options, {
keys: [File.expand_path('~/.ssh/id_rsa')],
forward_agent: true,
auth_methods: %w(publickey)
}
 
server '172.31.24.164', user: 'rails', roles: %w{web app db}
server '172.31.6.15', user: 'rails', roles: %w{web app db}
