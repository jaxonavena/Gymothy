# frozen_string_literal: true

class SitesController < ApplicationController
  before_action :set_site, only: %i[show destroy]
  before_action :set_business

  def index
    @sites = @business.sites
  end

  def show
    @visitors = @site.members
    @visits = Visit.where(site_id: params[:id])
  end

  def new
    @site = @business.sites.new
  end

  def create
    @site = @business.sites.new(site_params)

    if @site.save
      redirect_to business_site_path(@business, @site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @site.destroy
      redirect_to business_path(@business), notice: 'Site was successfully deleted.'
    else
      redirect_to business_site_path(@business, @site), alert: 'Failed to delete the site.'
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
