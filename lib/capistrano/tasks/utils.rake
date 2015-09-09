namespace :utils do
  task :uni_restart do
    on roles(:app) do
#      invoke "bundle exec rake unicorn:restart"
#      execute "cd /home/rails/sample_stg/current/; ls"
#      execute "cd #{shared_path}; ls"
#      execute "cd #{current_path}; ls -l"
      execute "cd #{current_path}; bin/rake unicorn:restart"
    end
  end
  task :ls do
    on roles(:app) do
      execute "ls"
    end
  end
  task :perl_version do
    on roles(:app) do
      execute %[perl -v]
    end
  end
end
