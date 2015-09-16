namespace :unicorn do

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

  desc "Start unicorn for staging env."
  task(:staging) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E staging -D"
  }

  desc "Start unicorn for production env."
  task(:production) {
    config = Rails.root.join('config', 'unicorn.rb')
    sh "bundle exec unicorn_rails -c #{config} -E production -D"
  }

  desc "Start unicorn for dev env."
  task(:dev) {
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
    sh "pstree '#{unicorn_pid}'"
  end

  def unicorn_signal signal
    if unicorn_pid.nil? then
      print "Unicorn doesn't seem to be running!\n"
    else
      Process.kill signal, unicorn_pid
    end
  end

  def unicorn_old_signal signal
    if unicorn_old_pid.nil? then
      print "unicorn.pid.oldbin is not found.\n"
    else
      Process.kill signal, unicorn_old_pid
    end
  end

  def unicorn_pid
    begin
      current_path = Rails.root.join('')
      if File.exist?("#{current_path}/tmp/unicorn.pid")
        File.read("#{current_path}/tmp/unicorn.pid").to_i
      end
    end
  end

  def unicorn_old_pid
    begin
      current_path = Rails.root.join('')
      if File.exist?("#{current_path}/tmp/unicorn.pid.oldbin")
        File.read("#{current_path}/tmp/unicorn.pid.oldbin").to_i
      end
    end
  end
end
