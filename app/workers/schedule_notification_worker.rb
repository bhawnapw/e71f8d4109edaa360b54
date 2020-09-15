class ScheduleNotificationWorker 
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(tv_show_id)
    tv_show = TvShow.find(tv_show_id)
    if tv_show.present?
      notification_job_id = SendNotificationWorker.perform_at(tv_show.timing.to_time - 30.minutes, tv_show_id)
      tv_show.update_attribute(notification_job_id: notification_job_id)
    end
  end
end