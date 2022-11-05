class OrdersController < ApplicationController
  before_action :set_idol, only: %i[new create]

  def new
    @order = Order.new
  end

  def create
    puts "entrei"
    @order = Order.new()
    @order.idol = @idol
    @order.user = current_user
    if @order.save
      @idol.user = current_user
      @idol.save
      redirect_to myidols_idols_path
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

  def set_idol
    @idol = Idol.find(params[:idol_id])
  end
end
