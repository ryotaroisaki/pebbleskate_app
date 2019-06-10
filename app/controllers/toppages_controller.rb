class ToppagesController < ApplicationController
  def index
    @user = User.new
    @videos = Video.all
    @genres = Genre.all
    @count_clips = Video.all.count
  end
end
