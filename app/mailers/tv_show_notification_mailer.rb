class TvShowNotificationMailer < ApplicationMailer
  def send_favorite_show_notification(user_id, tv_show_id)
    @user = User.find(user_id)
    @tv_show = TvShow.find(tv_show_id)
    @subject = "Your favorite tv show #{@tv_show.name} will start at #{@tv_show.timing} on channel #{@tv_show.channel&.name}"
    mail(to: @user.email, subject: @subject)
  end
end
