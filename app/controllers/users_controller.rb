class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @Users = User.all
  end

  def show
    begin
      @target_user = User.find(params[:id])
      @books = Book.where(user_id: @target_user.id)
      @new_book = Book.new
      @current_user_id = current_user.id
    rescue
      redirect_to users_path
    end

  end
  
  def edit
    target_user_id = params[:id]

    if target_user_id == current_user.id
      redirect_to 'show/#{current_user.id}'
    end

    @target_user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id), notice: "You have updated user successfully."
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :introduction, :image)
  end

  def correct_user
    begin
      user = User.find(params[:id])
    rescue
      redirect_to users_path(current_user.id)
    end

    if  user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
