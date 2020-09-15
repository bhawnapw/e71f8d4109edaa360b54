class TvShow < ApplicationRecord
  belongs_to :channel
  has_many :favourite_tv_shows, dependent: :destroy
  has_many :favourite_users, through: :favourite_tv_shows, source: :user, class_name: "User"

  after_destroy :cancel_notification, if: :notification_job_id?
  before_save :sheduler_notification, if: :timing_changed?

  def favourite?(current_user)
    self.favourite_users.include?(current_user)
  end

  private
    def sheduler_notification
      cancel_notification if notification_job_id.present?
      self.notification_job_id = SendNotificationWorker.perform_at(self.timing.to_time - 30.minutes, self.id)
    end

    def cancel_notification
      Sidekiq::Status.cancel self.notification_job_id
    end
end
