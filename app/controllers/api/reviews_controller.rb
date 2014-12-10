class Api::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save!
      puts "hello"
    else
      puts "hello"
    end
    return
  end
  private
  def review_params
    params.require(:review).permit(:user_id, :user_name, :content, :stars, :listing_id)
  end
end
