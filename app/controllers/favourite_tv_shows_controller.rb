class FavouriteTvShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourite_tv_shows = current_user.favourite_tv_shows
  end

  def favourite
    favourite = current_user.favourite_tv_shows.new(tv_show_id: params[:show_id])
    if favourite.save
      flash[:notice] = 'You have favorite succesfully'
    else
      flash[:alert] = 'Error in making favourite'
    end

    redirect_to root_path
  end

  def unfavourite
    favourite = current_user.favourite_tv_shows.find_by(tv_show_id: params[:show_id])
    if favourite.present? && favourite.destroy
      flash[:notice] = 'You have unfavorite succesfully'
    else
      flash[:alert] = 'Error in making unfavourite'
    end
    redirect_to root_path
  end
end
