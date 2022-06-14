class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start, :stop, :allday, :memo))
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users
    else
      flash[:notice] = "スケジュールを登録できませんでした。"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start, :stop, :allday, :memo))
      flash[:notice] = "スケジュールIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      flash[:notice] = "スケジュールを更新できませんでした"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to :users
  end

end
