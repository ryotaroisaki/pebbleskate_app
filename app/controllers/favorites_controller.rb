class FavoritesController < ApplicationController

  def create
    video = Video.find(params[:video_id])
    current_user.like(video)
    flash[:success] = '動画を追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    video = Video.find(params[:video_id])
    current_user.unlike(video)
    flash[:success] = '動画をライブラリから削除しました。'
    redirect_back(fallback_location: root_path)
  end

end
