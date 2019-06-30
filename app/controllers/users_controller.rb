class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def index
    @users = User.all
    @user = current_user
  end
  def show
    @user = User.find(params[:id])
    @memo = current_user.memos.build
    @memos = @user.memos.order('created_at DESC').page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)


    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = user_params[:name]
    @user.email = user_params[:email]

    if user_params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = user_params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to current_user
    else
      render edit
    end
  end


  def library
    @user = User.find(params[:id])
    @liked = @user.liked.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image_name, :password_confirmation)
  end
end
