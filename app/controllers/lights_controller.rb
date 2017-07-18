class LightsController < ApplicationController

  def create
    @light = Light.create(light_params)
    if @light.save
      redirect_to towa_path(@light.meaning.towa)
    end
  end

  private
    def light_params
      params.permit(:score).merge(meaning_id: params[:meaning_id], user_id: current_user.id)
    end
end
