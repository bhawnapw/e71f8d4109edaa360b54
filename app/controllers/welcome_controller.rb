class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    term = params[:term]
    if term.present?
      term  = "%#{term}%".downcase
      @tv_shows = TvShow.joins(:channel).where("lower(tv_shows.name) LIKE (?) OR lower(channels.name) LIKE (?)", term, term)
    else
      @tv_shows = TvShow.joins(:channel)
    end
  end
end
