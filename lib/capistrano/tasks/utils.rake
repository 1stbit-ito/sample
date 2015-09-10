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
  task :env do
    on roles(:app) do
      execute "export SECRET_KEY_BASE=ec6efc03b53aeeb6f0df823a1e42583292d8f524264eac661e08121bbfd138a675a63b35b640c347989057ad0ffbfd21daff57532fe3fa105b00556aa3acad6f"
      execute "env"
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
