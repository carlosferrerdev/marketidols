class IdolsController < ApplicationController
  before_action :set_idol, only: %i[show destroy]

  def index
    @idols = Idol.all
  end

  def show
    # @idol = Idol.find(params[:id])
  end

  def new
    @idol = Idol.new
  end

  def create
    @idol = Idol.new(idol_params)
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

  private

  def idol_params
    params.require(:idol).permit(:name, :power)
  end

  def set_idol
    @idol = Idol.find(params[:id])
  end
end
