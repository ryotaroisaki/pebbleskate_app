class TricksController < ApplicationController
  before_action :require_user_logged_in

  def show
    @genres = Genre.all
    @genre = Trick.find(params[:id]).genre
    @trick = Trick.find(params[:id])
    @videos = @trick.clips.order('created_at DESC').page(params[:page])
  end

  def new
    @trick = Trick.new
  end

  def create
  end

  def destroy
  end
end
