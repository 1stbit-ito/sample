namespace :unicorn_stg do
  desc "Start unicorn for development env."
  task(:start) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E development -D"
  }
  
  desc "Start unicorn for local env."
  task(:local) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E local -D"
  }

  desc "Start unicorn for dev env."
  task(:dev) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E development -D"
  }
  desc "Start unicorn for staging env."
  task(:staging) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E development -D"
  }

  desc "Stop unicorn"
  task(:stop) { unicorn_signal :QUIT }

  desc "Restart unicorn with USR2"
  task(:restart) {
    unicorn_signal :USR2
    unicorn_old_signal :WINCH
    unicorn_old_signal :QUIT
  }

  desc "Increment number of worker processes"
  task(:increment) { unicorn_signal :TTIN }

  desc "Decrement number of worker processes"
  task(:decrement) { unicorn_signal :TTOU }

  desc "Unicorn pstree (depends on pstree command)"
  task(:pstree) do
    sh "pstree '#{unicorn_stg_pid}'"
  end

  def unicorn_signal signal
    Process.kill signal, unicorn_stg_pid
  end

  def unicorn_old_signal signal
    Process.kill signal, unicorn_old_stg_pid
  end

  def unicorn_stg_pid
    begin
#      File.read("/home/gameband/api/tmp/unicorn.pid").to_i
#      current_path = Rails.root.join('')
#      File.read("#{shared_path}/tmp/unicorn.pid").to_i
      File.read("/home/rails/sample_stg/shared/tmp/unicorn.pid").to_i
#    rescue Errno::ENOENT
#      raise "Unicorn doesn't seem to be running"
    end
  end

  def unicorn_old_stg_pid
    begin
#      File.read("/home/gameband/api/tmp/unicorn.pid.oldbin").to_i
#      current_path = Rails.root.join('')
#      File.read("#{shared_path}/tmp/unicorn.pid.oldbin").to_i
      File.read("/home/rails/sample_stg/shared/tmp/unicorn.pid.oldbin").to_i
#    rescue Errno::ENOENT
#      raise "unicorn.pid.oldbin is not found."
    end
  end
end
