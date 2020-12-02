class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @order = Order.find(params[:order_id])
    @review.order = @order
    @product = @order.product
    skip_authorization
  end

  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    authorize @review
    if @review.save
      redirect_to orders_path
    else
      render :new
    end
    skip_authorization
  end

  def destroy
    @review = Review.find(params_review)
    # @orders = current_user.orders
    @review.destroy
    redirect_to orders_path(@orders)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
