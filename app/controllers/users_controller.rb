class UsersController < ApplicationController
  before_action :authorize, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @user =   User.find(params[:id])
    @email_address = @user.email
    @reviews = Review.where(user_email: @email_address)

  end

  def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
     redirect_to new_session_path
  end
end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
        if @user.update_attributes(user_edit_params)
          redirect_to user_path(params[:id])
        else
          redirect_to edit_user_path(params[:id])
        end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

  def user_edit_params
    params.require(:user).permit(:name,:email,:password, :headline, :bio, :city, :state, :nurse_type, :agency, :image)
  end

end
