class TowasController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @meanings = Meaning.order("created_at DESC").includes(:towa)
    @towa = Towa.new(towa_params)
    if @towa.save
      redirect_to root_path, notice: '『とは』がまたひとつ作成されました'
    else
      flash.now[:alert] = @towa.errors.full_messages.join(",")
      render template: "static_pages/home"
    end
  end

  private
    def towa_params
      params.require(:towa).permit(:towa, meanings_attributes: [:meaning, :user_id])
    end
end
