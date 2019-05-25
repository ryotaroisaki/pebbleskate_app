class VideosController < ApplicationController

  def index

  end

  def show
    @video = Video.find(params[:id])
  end

  def new
   @video = Video.new
  end

  def create

    video = Video.new(video_params)
    video.save

    relationship = Relationship.new(video_id: "video.id", genre_id: "video.name")
    relationship.save

    flash[:success] = '動画をジャンルに紐つけて投稿しました'
    redirect_to root_url
  end



 private

  def video_params
    params.require(:video).permit(:iframe_url, :trick, :skater, :instagram_url, :video_url, :video_type, :name, { :type_ids => [] }, :name, { :name_ids => [] })
  end

end
