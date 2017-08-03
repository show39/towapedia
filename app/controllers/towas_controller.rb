class TowasController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @meanings = Meaning.order("created_at DESC").includes(:towa, :user).page(params[:page])
    @towa = Towa.new(towa_params)
    @user = current_user
    @current_user_meanings = Meaning.where(user_id: current_user.id)
    @towas = Towa.all
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

  def edit
    if user_signed_in? && current_user.role == 1
      @towa = Towa.find(params[:id])
      @towatop = Towa.find(params[:id])
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    @towa = Towa.find(params[:id])
    @towatop = Towa.find(params[:id])
    if @towa.update(towa_params)
      redirect_to towa_path(@towa), notice: '『とは』の編集に成功しました'
    else
      flash.now[:alert] = @towa.errors.full_messages.join(",")
      @meanings = @towatop.meanings.joins(:lights).group("lights.meaning_id").order("sum(lights.score) desc").select("meanings.*, sum(lights.score) as sum_score")
      @noscore_meanings = @towatop.meanings
      @light = Light.new
      @user = current_user
      render template: "towas/edit"
    end
  end

  def destroy
    towa = Towa.find(params[:id])
    towa.destroy
    redirect_to root_path, notice: '『とは』を削除しました'
  end

  private
    def towa_params
      params.require(:towa).permit(:towa, meanings_attributes: [:meaning, :referer, :user_id])
    end

    def  meaning_params
      params.require(:meaning).permit(:meaning, :referer).merge(towa_id: params[:towa_id], user_id: current_user.id)
    end
end
