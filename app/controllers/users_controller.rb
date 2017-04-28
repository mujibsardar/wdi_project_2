class UsersController < ApplicationController
  before_action :authorize, only: [:edit]


  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def show
    @user =  User.find(params[:id])
    @email_address = @user.email
    @reviews = Review.where(user_email: @email_address)
    @display_review_option = hasNotReviewed(@user.id)
  end

  def new
  @user = User.new
  @nurse = true
  @nurse = false unless params[:nurse]
  end

def create
  @user = User.new(user_params)

  if @user.save
     redirect_to root_path
   else
     render 'new'
   end
end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    # @user.nurse = false
        if @user.update_attributes(user_edit_params)
          redirect_to user_path(params[:id])
        else
          redirect_to edit_user_path(params[:id])
        end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation,:headline, :bio, :city, :state, :nurse_type, :nurse, :agency, :image)
  end

  def user_edit_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation, :headline, :bio, :city, :state, :nurse_type, :nurse, :agency, :image)
  end

  def hasNotReviewed(id)
    if logged_in?
    email_address = current_user.email
    reviews = Review.where(user_email: email_address)

      reviews.each do |rv|
        if rv.user_id == id
          return false
        end
      end
      return true
    else
      return false
    end

    return true
  end


end
