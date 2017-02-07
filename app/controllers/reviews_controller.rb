class ReviewsController < ApplicationController

  before_action :find_review, only: [:show, :destroy]
  before_action :find_product
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to products_url, notice: 'Review created!'
    else
      render 'products/show'
    end
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
