class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy]

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @config = Config.new
  end

  # GET /configs/1/edit
  def edit
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    check_priv
    respond_to do |format|

      if @config.update!(config_params)
        format.html {
          redirect_to edit_config_path(@config),
                      notice: 'Config was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  rescue => e
    render :edit, notice: e.to_s
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_config
    @config = Config.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def config_params
    params.require(:config).permit(
      :id,
      :user_id,
      tag_attributes: [:id, :name],
      invite_code_attributes: [:id, :start, :finish, :code]
    )
  end

  def check_priv
    authenticate
    if @config.user.id != current_user.id
      raise '対象の設定は更新できません。オーナーが違います'
    end
  end
end
