class ToppagesController < ApplicationController
  def index
    @videos = Video.all
    
    @count_clips = Video.all.count
    @count_flatground = Genre.find(1).clips.count
    @count_ledge = Genre.find(2).clips.count
    @count_rail = Genre.find(3).clips.count
    @count_stairs = Genre.find(4).clips.count
  end
end
