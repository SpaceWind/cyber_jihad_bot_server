class ActiveKeysController < ApplicationController
  before_action :set_active_key, only: [:show, :edit, :update, :destroy]

  # GET /active_keys
  # GET /active_keys.json
  def index
    @active_keys = ActiveKey.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_key
      @active_key = ActiveKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def active_key_params
      params.require(:active_key).permit(:apikey, :login, :last_updated, :heroid, :last_controlled, :rolled_heroid)
    end
end
