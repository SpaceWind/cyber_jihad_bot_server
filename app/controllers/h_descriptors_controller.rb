class HDescriptorsController < ApplicationController
  before_action :set_h_descriptor, only: [:show, :edit, :update, :destroy]

  # GET /h_descriptors
  # GET /h_descriptors.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_h_descriptor
      @h_descriptor = HDescriptor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def h_descriptor_params
      params.require(:h_descriptor).permit(:hid, :hero_name, :mood, :map, :pack_max_size, :experience, :exp_to_next_lvl, :x_pos, :y_pos, :hclass, :hrace)
    end
end
