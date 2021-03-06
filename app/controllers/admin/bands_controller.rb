class Admin::BandsController < ApplicationController
  before_action :authenticate_member!

  def index
    #@bands = Band.all

    @filterrific = initialize_filterrific(
        Band,
        params[:filterrific],
        select_options: {
        },
        persistence_id: "shared_key",
        default_filter_params: {},
        available_filters: [:sorted_by, :name_filter],
        sanitize_params: true,
    ) || return

    @bands = @filterrific.find.page(params[:page])


  end

  def edit
    @band = Band.find params[:id]
  end

  def update
    @band = Band.find params[:id]
    @band.update_attributes band_params
    redirect_to action: :index
  end

  def new
    @band = Band.new
  end

  def create
    Band.create(band_params)
    redirect_to action: :index
  end

  def destroy
    Band.find(params[:id]).destroy!
    redirect_to action: :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
