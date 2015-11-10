class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = @user.discounts
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
    @discount = @user.discounts.find(params[:id])
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
    @discount = @user.discounts.find(params[:id])
  end

  # POST /discounts
  # POST /discounts.json
  def create
    @company = Company.find_by(company_name: params[:company][:company_name])
      
    if not @company
      @company = Company.create(
        company_name:   params[:company][:company_name]
      )
    end

    @discount = Discount.new(
      user: @user,
      company: @company,
      discount_percent: params[:discount][:discount_percent],
      restrictions: params[:discount][:restrictions]
      )

    respond_to do |format|
      if @discount.save
        format.html { redirect_to user_path(@user), notice: 'Discount was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discount }
      else
        format.html { render action: 'new' }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts/1
  # PATCH/PUT /discounts/1.json
  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to @discount, notice: 'Discount was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount.destroy
    respond_to do |format|
      format.html { redirect_to discounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_params
      params.require(:discount).permit(:company_id, :user_id, :discount_percent, :restrictions, company_attributes: [:id, :company_name])
    end

end
