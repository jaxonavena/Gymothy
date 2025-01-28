# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :set_site
  before_action :set_visit, only: %i[show destroy]

  def index
    @visits = @site.visits
  end

  def show
  end

  def new
    @visit = @site.visits.new
  end

  def create
    @visit = @site.visits.new(visit_params)

    if @visit.save
      @visit.member.visit(@site) # The form creates the visit, but doesn't increment the :count by 1, so we do it here.
      redirect_to business_site_visit_path(@site.business, @site, @visit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @visit.destroy
      redirect_to business_site_path(@site.business, @site), notice: 'Visit was successfully deleted.'
    else
      redirect_to business_site_visit_path(@business, @site, @visit), alert: 'Failed to delete the visit.'
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:site_id, :member_id)
  end

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def set_site
    @site = Site.accessible_by_user(current_user).find(params[:site_id])
  end
end
