# Set Puma to listen on a specific port (default: 8000)
port ENV.fetch("PORT", 3000)

# Set min and max threads (per worker)
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 4 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Set number of workers (match CPU cores)
worker_count = ENV.fetch("WEB_CONCURRENCY") { 2 }
workers worker_count

# Preload the app for faster boot times and memory efficiency
preload_app!

# Specify a PID file if provided in the environment
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Restart workers that use too much memory (helps with memory leaks)
# Adjust max_memory (in MB) based on available RAM
worker_timeout 60
worker_boot_timeout 60

on_worker_boot do
  # Reconnect ActiveRecord to ensure workers have separate DB connections
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Graceful shutdown handling
on_worker_shutdown do
  Rails.logger.info "Worker shutting down..."
end

# Allow Puma to be restarted by `rails restart` command
plugin :tmp_restart

# Enable cluster mode (improves performance)
fork_worker
