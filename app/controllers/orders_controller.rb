class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = User.find(current_user.id).orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @user = current_user
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.product = Product.find(params[:product_id])
    @order.status = "pending"
    if @order.save
      redirect_to orders_path
    else
      @product = @order.product
      @user = current_user
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(order).permit(:status)
  end
end