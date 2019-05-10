class GenresController < ApplicationController
  
  def index
     @genres = Genre.search(params[:search])
  end

  def show
    @genre = Genre.find(params[:id])
    @videos = @genre.clips.order('created_at DESC').page(params[:page])
   
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
      flash.now[:danger] = '新ジャンルのの登録に失敗しました。'
      render :root_url
    end
  end

  def destroy
  end
  
  private
  
  def genre_params
    params.require(:genre). permit(:name)
  end

end