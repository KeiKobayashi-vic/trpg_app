directory '/home/ubuntu/trpg_app'



threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)

threads threads_count, threads_count



bind 'unix:///home/ubuntu/trpg_app/tmp/sockets/puma.sock'



pidfile '/home/ubuntu/trpg_app/tmp/pids/puma.pid'

state_path '/home/ubuntu/trpg_app/tmp/pids/puma.state'



plugin :tmp_restart
