class ReviewsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
  end

  def show
  end

  def new
    @review = Review.new
    @review.user_id = params[:user_id]
    @review.user_email = current_user.email
    # @user_email = //get current logged in user email address

  end

  def create

    @review = Review.new(review_params)

    if @review.save
       redirect_to user_path(@review.user_id)
     else
        redirect_to root_path
     end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:body,:rating, :user_id, :user_email)
  end
end
