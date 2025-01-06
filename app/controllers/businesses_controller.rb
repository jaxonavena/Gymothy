# frozen_string_literal: true
class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update]

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
    @sites = @business.sites
    @members = @business.members
    @employees = @business.employees
  end

  def edit
  end

  def update
    if @business.save
      redirect_to @business
    else
      redirect_to edit_business_path(@business)
    end
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name)
  end
end
