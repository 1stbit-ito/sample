class User3sController < ApplicationController
  before_action :set_user3, only: [:show, :edit, :update, :destroy]

  # GET /user3s
  # GET /user3s.json
  def index
    @user3s = User3.all
  end

  # GET /user3s/1
  # GET /user3s/1.json
  def show
  end

  # GET /user3s/new
  def new
    @user3 = User3.new
  end

  # GET /user3s/1/edit
  def edit
  end

  # POST /user3s
  # POST /user3s.json
  def create
    @user3 = User3.new(user3_params)

    respond_to do |format|
      if @user3.save
        format.html { redirect_to @user3, notice: 'User3 was successfully created.' }
        format.json { render :show, status: :created, location: @user3 }
      else
        format.html { render :new }
        format.json { render json: @user3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user3s/1
  # PATCH/PUT /user3s/1.json
  def update
    respond_to do |format|
      if @user3.update(user3_params)
        format.html { redirect_to @user3, notice: 'User3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @user3 }
      else
        format.html { render :edit }
        format.json { render json: @user3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user3s/1
  # DELETE /user3s/1.json
  def destroy
    @user3.destroy
    respond_to do |format|
      format.html { redirect_to user3s_url, notice: 'User3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user3
      @user3 = User3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user3_params
      params.require(:user3).permit(:name, :email)
    end
end
