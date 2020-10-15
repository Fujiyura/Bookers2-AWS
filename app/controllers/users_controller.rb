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
  
  private
  def new
    Book.new
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, image)
  end
end
