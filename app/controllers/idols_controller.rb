class IdolsController < ApplicationController
  before_action :set_idol, only: %i[show destroy]

  def index
    @idols = Idol.all
    # if user_signed_in? && current_user != @idol.user
    # For Mapbox
    @markers = @idols.geocoded.map do |idol|
      {
        lat: idol.latitude,
        lng: idol.longitude
      }
    end
  end

  def show
    # @idol = Idol.find(params[:id])
    # @order = Order.new
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
    redirect_to idols_path
  end

  def myidols
    # @idols = Idol.where()
    @idols = current_user.idols
  end

  private

  def idol_params
    params.require(:idol).permit(:name, :power, :description, photos: [])
  end

  def set_idol
    @idol = Idol.find(params[:id])
  end
end
