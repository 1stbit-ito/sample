# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'sample'
set :repo_url, 'git@github.com:1stbit-ito/sample.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/rails/sample_stg'
# set :deploy_to, '/home/rails/sample_dev'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# rbenvの設定 (環境によってrbenvの場所が違うと思います。)
set :default_env, {
  rbenv_root: "/usr/local/rbenv/",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}
 
# nokogiri はシステムライブラリを使うため bundle install にオプションを指定する
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

# デフォルトで設定されている --deployment を消す
set :bundle_flags, "--quiet"

namespace :deploy do

  desc 'Restart application'
  task :restart do
#    invoke 'unicorn_stg:restart'
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
# unicorn:restart だと変更したモノが有効にならない。。。 ナゼ？？
#          execute :bundle, :exec, :rake, 'unicorn:restart'

          execute :bundle, :exec, :rake, 'unicorn:stop'
          execute :bundle, :exec, :rake, 'unicorn:start'
        end
      end
    end
  end

#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
#    end
#  end

end

after 'deploy:publishing', 'deploy:restart'