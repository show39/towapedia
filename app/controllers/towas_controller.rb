class TowasController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @meanings = Meaning.order("created_at DESC").includes(:towa, :user)
    @towa = Towa.new(towa_params)
    @user = current_user
    if @towa.save
      redirect_to root_path, notice: '『とは』がまたひとつ作成されました'
    else
      flash.now[:alert] = @towa.errors.full_messages.join(",")
      render template: "static_pages/home"
    end
  end

  def show
    @towatop = Towa.find(params[:id])
    @meanings = @towatop.meanings.joins(:lights).group("lights.meaning_id").order("sum(lights.score) desc").select("meanings.*, sum(lights.score) as sum_score")
    @noscore_meanings = @towatop.meanings
    @light = Light.new
    if user_signed_in?
      @user = current_user
      @meaning = Meaning.new
      @current_user_meanings = Meaning.where(user_id: current_user.id)
    end
  end

  private
    def towa_params
      params.require(:towa).permit(:towa, meanings_attributes: [:meaning, :referer, :user_id])
    end
end
