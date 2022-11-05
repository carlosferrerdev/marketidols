class IdolsController < ApplicationController
  before_action :set_idol, only: %i[show destroy]

  def index
    if params[:query].present?
      # query = "title @@ :query OR description @@ :query"
      # @idols = Idol.where(query, query: "%#{params[:query]}%")
      @idols = Idol.search_by_name_and_description(params[:query])
    else
      @idols = Idol.all
    end
    # if user_signed_in? && current_user != @idol.user

  end

  def show
    # @idol = Idol.find(params[:id])
    # @order = Order.new
    @markers = [
      {
        lat: @idol.latitude,
        lng: @idol.longitude,
        info_window: render_to_string(partial: "info_window", locals: {idol: @idol}),
        image_url: helpers.asset_url("/Users/carlos/code/carlosferrerdev/marketidols/app/assets/images/logo.png")
      }
    ]
  end

  def new
    @idol = Idol.new
  end

  def create
    @idol = Idol.new(idol_params)
    @idol.user = current_user
    if @idol.save
      redirect_to idol_path(@idol)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @idol.destroy
    redirect_to myidols_idols_path
  end

  def myidols
    if params[:query].present?
      @idols = Idol.search_by_name_and_description(params[:query])
    else
      @idols = Idol.where(user: current_user)
    end
    @my_order = Order.where(user_id: current_user.id)
  end

  private

  def idol_params
    params.require(:idol).permit(:name, :power, :description, :address, :price, photos: [])
  end

  def set_idol
    @idol = Idol.find(params[:id])
  end
end
