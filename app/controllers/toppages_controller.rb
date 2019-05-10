class ToppagesController < ApplicationController
  def index
    @videos = Video.all
  end
end
