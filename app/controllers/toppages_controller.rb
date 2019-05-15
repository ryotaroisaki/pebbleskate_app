class ToppagesController < ApplicationController
  def index
    @videos = Video.all
    @genres = Genre.all
    @count_clips = Video.all.count
  end
end
