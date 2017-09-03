class LightsController < ApplicationController

  def create
    @light = Light.create(light_params)
    if @light.save
      if cookies[:light_cookies] == nil
        cookies[:light_cookies] = params[:meaning_id]
      else
        @cookies = []
        @cookies << cookies[:light_cookies]
        cookies[:new_cookie] = params[:meaning_id]
        @cookies << cookies[:new_cookie]
        cookies[:light_cookies] = @cookies
      end
      redirect_to towa_path(@light.meaning.towa)
    end
  end

  private
    def light_params
      params.permit(:score).merge(meaning_id: params[:meaning_id])
    end
end
