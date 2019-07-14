class FavoritesController < ApplicationController

  def create
    video = Video.find(params[:video_id])
    current_user.like(video)
    flash[:success] = '動画をお気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    video = Video.find(params[:video_id])
    current_user.unlike(video)
    flash[:danger] = '動画をお気に入りから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
