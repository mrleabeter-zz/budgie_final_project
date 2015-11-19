class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :set_company_and_discount

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @company = Company.new
    @discount = Discount.new
  end

  # GET /users/new
  def new
    # @user = User.new(:invitation_token => params[:invitation_token])
    # @user.email = @user.invitation.receipient_email if @user.invitation
    @user = User.new
    @company = Company.new
    @discount = Discount.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    create_helper
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to companies_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    session.clear
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :username, :email, :password, :password_confirmation, :city, discounts_attributes: [
          :id, :discount_percent, :restrictions, company_attributes: [
            :id, :company_name, :store_pic, :logo
          ]
        ]
      )
    end

    def create_helper
      @user = User.new(user_params)
      @user.save
      @company = Company.find_or_create_by(company_name: params[:company][:company_name])

      # @company.update_attributes(params.require(:company).permit(:company_name, :store_pic, :logo))
      # @company.save 
    
      @discount = Discount.new(
        user_id: @user.id,
        company_id: @company.id,
        discount_percent: params[:discount][:discount_percent],
        restrictions: params[:restriction].join("\n"))
      @discount.save
    end

end
