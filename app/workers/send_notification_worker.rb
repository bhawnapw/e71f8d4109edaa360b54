class SendNotificationWorker 
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(tv_show_id)
    tv_show = TvShow.find_by_id(tv_show_id)
    if tv_show.present?
      favourite_users = tv_show.favourite_users
      favourite_users.each do |user|
        TvShowNotificationMailer.send_favorite_show_notification(user.id, tv_show.id)
      end
    end
  end
end