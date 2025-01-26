class MembershipsController < ApplicationController
  before_action :set_business
  before_action :set_membership, only: %i[show edit update destroy]

  def index
    @memberships = Membership.all
  end

  def new
    @membership = @business.memberships.new
  end

  def create
    @membership = @business.memberships.new(membership_params)

    if @membership.save
      redirect_to business_membership_path(@business, @membership)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @membership.destroy!
  end

  private

  def membership_params
    params.require(:membership).permit(:business_id, :member_id)
  end

  def set_business
    @business = Business.find(params[:business_id])
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end
end
