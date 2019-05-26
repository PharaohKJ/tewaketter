class InviteCodesController < ApplicationController
  before_action :set_invite_code, only: [:show, :edit, :update, :destroy]

  # GET /invite_codes
  # GET /invite_codes.json
  def index
    @invite_codes = InviteCode.all
  end

  # GET /invite_codes/1
  # GET /invite_codes/1.json
  def show
  end

  # GET /invite_codes/new
  def new
    @invite_code = InviteCode.new
  end

  # GET /invite_codes/1/edit
  def edit
  end

  # POST /invite_codes
  # POST /invite_codes.json
  def create
    @invite_code = InviteCode.new(invite_code_params)

    respond_to do |format|
      if @invite_code.save
        format.html { redirect_to @invite_code, notice: 'Invite code was successfully created.' }
        format.json { render :show, status: :created, location: @invite_code }
      else
        format.html { render :new }
        format.json { render json: @invite_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invite_codes/1
  # PATCH/PUT /invite_codes/1.json
  def update
    respond_to do |format|
      if @invite_code.update(invite_code_params)
        format.html { redirect_to @invite_code, notice: 'Invite code was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite_code }
      else
        format.html { render :edit }
        format.json { render json: @invite_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_codes/1
  # DELETE /invite_codes/1.json
  def destroy
    @invite_code.destroy
    respond_to do |format|
      format.html { redirect_to invite_codes_url, notice: 'Invite code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite_code
      @invite_code = InviteCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_code_params
      params.require(:invite_code).permit(:config_id, :code, :start, :finish)
    end
end
