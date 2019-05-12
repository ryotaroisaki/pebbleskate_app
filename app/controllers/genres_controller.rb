class GenresController < ApplicationController
  
  def index
     @genres = Genre.search(params[:search])
  end

  def show
    @genre = Genre.find(params[:id])
    @videos = @genre.clips.order('created_at DESC').page(params[:page])
    
    @count_clips = Video.all.count
    @count_flatground = Genre.find(1).clips.count
    @count_ledge = Genre.find(2).clips.count
    @count_rail = Genre.find(3).clips.count
    @count_stairs = Genre.find(4).clips.count
   
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = '新ジャンルを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新ジャンルの登録に失敗しました。'
      render :root_url
    end
  end

  def destroy
  end
  
  def option
    @genres = Genre.all
  end  
  
  def select
    @genre = Genre.find(params[:id])
    @trick = Trick.new
  end
  
  def trickcreate
    
    genre = Genre.find(params[:id])
    trick = genre.tricks.build(trick_params)
    if trick.save
    flash[:success] = '新トリックを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新トリックの登録に失敗しました。'
      render :root_url
    end
  end

  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def trick_params
    params.require(:trick).permit(:name)
  end

end