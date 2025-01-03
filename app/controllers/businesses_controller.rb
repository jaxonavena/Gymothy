# frozen_string_literal: true
class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @business = Business.find(params[:id])
    @sites = @business.sites
    @members = @business.members
    @employees = @business.employees
  end

  private

  def business_params
    params.require(:business).permit(:name)
  end
end
