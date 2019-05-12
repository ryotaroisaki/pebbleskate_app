class TricksController < ApplicationController
  def show
    @trick = Trick.find(params[:id])
    @videos = @trick.clips.order('created_at DESC').page(params[:page])
  end

  def new
    @trick = Trick.new
  end

  def create
    genre = Genre.find(trick_params[:genre_id])
    @trick = genre.tricks.new(trick_params[:name])
    
      
    if @trick.save 
      flash[:success] = 'トリックを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'トリックの登録に失敗しました。'
      render :root_url
    end
  end

  def destroy
  end
  
  private
  
  def trick_params
    params.require(:trick).permit(:name, :name, { :genre_id => [] })
  end
  
end