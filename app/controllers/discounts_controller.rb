class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]
  # before_action :set_user 
  before_action :set_company

 
  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = @company.discounts
    @favorites = @company.favorites
    @users = User.all
    @companies = Company.all
  end  
  # GET /discounts/1
  # GET /discounts/1.json
  def show
    @discount = @company.discounts.find(params[:id])
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

    @company = Company.find_or_create_by(company_name: params[:company][:company_name])
    @discount = Discount.find_or_create_by(id: params[:discount][:id])

    @discount.user_id = session[:user_id]
    @discount.company_id = @company.id
    @discount.discount_percent = params[:discount][:discount_percent]
    @discount.restrictions = params[:restriction].join("\n")

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
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_params
      params.require(:discount).permit(:company_id, :user_id, :discount_percent, :restrictions, company_attributes: [:id, :company_name])
    end

    def upvote 
      @link = Link.find(params[:id])
      @link.upvote_by current_user
      # redirect_to :back
    end  

    def downvote
      @link = Link.find(params[:id])
      @link.downvote_by current_user
      # redirect_to :back
    end
    
end
