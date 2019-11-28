
Delayed::Worker.delay_jobs = !Rails.env.test?
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.logger = ActiveSupport::BufferedLogger.new("log/#{Rails.env}_delayed_jobs.log", Rails.logger.level)
