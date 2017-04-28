class ReviewsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
  end

  def show
  end

  def new
    # @reviews =
    redirect_to root_path unless hasNotReviewed(params[:user_id].to_i)
    p "***&&&&&^^^^^^-----------------------------------------------"
    @review = Review.new
    @review.user_id = params[:user_id]
    @review.user_email = current_user.email
    p "***&&&&&^^^^^^-----------------------------------------------"
    # @user_email = //get current logged in user email address

  end

  def create
    @review = Review.new(review_params)

    if (@review.rating > 0 && @review.rating <= 100 && @review.save)
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
    @review = Review.find(params[:id])

    if @review.destroy
      calcualte_review_score(@review.user_id)
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:body,:rating, :user_id, :user_email)
  end

  # def calcualte_review_score(userID)
  #   user = User.find(userID)
  #   # review_score = calcualte_review_score(@review.user_id)
  #   reviews = User.find(userID).reviews
  #   avg_score = 0
  #   counter = 0
  #   reviews.each do |s|
  #     if s.rating?
  #     counter += 1
  #     avg_score += s.rating
  #     end
  #   end
  # avg_score = avg_score / counter
  # user.average_score = avg_score
  # user.save
  # end

  def hasNotReviewed(id)
    email_address = current_user.email
    reviews = Review.where(user_email: email_address)

    if logged_in?
      reviews.each do |rv|
        if rv.user_id == id
          return false
        end
      end
    else
      return false
    end
    return true
  end

end
