class UsersController < ApplicationController
  def index
    @Users = User.all
  end

  def show
    @target_user = User.find(params[:id])
    @books = Book.where(user_id: @target_user.id)
    @new_book = Book.new
    @current_user_id = current_user.id
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
end
