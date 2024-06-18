class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(:latitude, :longitude, :address, :phone, :name)
  end
end
