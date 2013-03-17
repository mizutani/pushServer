timeout = 75
listen 3000 # by default Unicorn listens on port 8080
worker_processes 2 # this should be >= nr_cpus
pid Rails.root + "/tmp/pids/unicorn.pid"
