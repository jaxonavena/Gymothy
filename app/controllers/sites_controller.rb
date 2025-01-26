# frozen_string_literal: true

class SitesController < ApplicationController
  before_action :set_site, only: %i[show]
  before_action :set_business, only: %i[new create index]

  def index
    @sites = @business.sites
  end

  def show
    @visitors = @site.members
  end

  def new
    @site = @business.sites.new
  end

  def create
    @site = @business.site.new(site_params)

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

  def set_site
    @site = Site.accessible_by_user(current_user).find(params[:id])
  end

  def set_business
    @business = Business.accessible_by_user(current_user).find(params[:business_id])
  end
end
