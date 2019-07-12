class VideosController < ApplicationController
  before_action :require_user_logged_in


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
    relationship = Relationship.new(video_id: "video.id", genre_id: "video.name")
    connection = Connection.new(video_id: "video.id", trick_id: "video.name")


    if video.save && relationship.save && connection.save
      flash[:success] = '動画をジャンルに紐付けて投稿しました'
      redirect_to root_url
    else
      flash[:danger] = '動画の投稿に失敗しました'
      redirect_to root_url
    end
  end



 private

  def video_params
    params.require(:video).permit(:iframe_url, :trick, :skater, :instagram_url, :video_url, :video_type, :name, { :type_ids => [] }, :name, { :name_ids => [] })
  end

end
