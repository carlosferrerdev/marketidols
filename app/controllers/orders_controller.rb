class OrdersController < ApplicationController
  before_action :set_idol, only: %i[new create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.idol = @idol
    if @order.save
      redirect_to idol_path(@idol)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to idol_path(@order.idol), status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:price, :idol_id)
  end

  def set_idol
    @idol = Idol.find(params[:idol_id])
  end
end
