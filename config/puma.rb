workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))
threads_count = Integer(ENV.fetch("MAX_THREADS", 5))
threads(threads_count, threads_count)

preload_app!

rackup DefaultRackup
environment ENV.fetch("RACK_ENV", "development")

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

plugin :tmp_restart
