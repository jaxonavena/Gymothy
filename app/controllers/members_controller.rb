class MembersController < ApplicationController
  before_action :set_business
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.all
  end

  def show
    @memberships = Membership.where(member_id: @member)
  end

  # def new
  #   @member = @business.members.new
  # end

  def edit
  end

  # def create
  #   @member = @business.members.new(member_params)

  #   if @member.save
  #     redirect_to business_member_path(@business, @member)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def update
  end

  def destroy
    @member.destroy!
  end

  private

  def set_business
    @business = Business.find(params[:business_id])
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :role)
  end
end
