# frozen_string_literal: true
class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update analytics]

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
      render :new, status: :unprocessable_entity, notice: "Unable to create business."
    end
  end

  def show
    @sites = @business.sites
    @members = @business.members
    @employees = @business.employees

    # Fetch this business's events for the calendar view
    @today = Date.today
    start_date = params.fetch(:start_date, @today).to_date
    @events = @business.events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def edit
  end

  def update
    if @business.update(business_params)
      @business.toggle_schedule_display if @business.saved_change_to_display_schedule?

      redirect_to @business, notice: "Business updated successfully!"
    else
      redirect_to edit_business_path(@business), alert: "Unable to update business."
    end
  end

  def analytics
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :owner_name, :owner_phone, :display_schedule)
  end
end
