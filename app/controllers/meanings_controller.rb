class MeaningsController < ApplicationController

  def create
    @meaning = Meaning.create(meaning_params)
    @towatop = Towa.find(@meaning.towa.id)
    @user = current_user
    @current_user_meanings = Meaning.where(user_id: current_user.id)
    @meanings = @towatop.meanings.joins(:lights).group("lights.meaning_id").order("sum(lights.score) desc").select("meanings.*, sum(lights.score) as sum_score")
    @noscore_meanings = @towatop.meanings
    if @meaning.save
      redirect_to towa_path(@meaning.towa)
    else
      flash.now[:alert] = @meaning.errors.full_messages.join(",")
      render template: "towas/show"
    end
  end

  def edit
    if user_signed_in? && current_user.role == 1
      @user = current_user
      @meaning = Meaning.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @meaning = Meaning.find(params[:id])
    if @meaning.update(update_meaning_params)
      redirect_to towa_path(@meaning.towa), notice: '『意味』の編集に成功しました'
    else
      flash.now[:alert] = @meaning.errors.full_messages.join(",")
      @towa = Towa.find(@meaning.towa.id)
      @meanings = @towa.meanings.joins(:lights).group("lights.meaning_id").order("sum(lights.score) desc").select("meanings.*, sum(lights.score) as sum_score")
      @noscore_meanings = @towa.meanings
      @light = Light.new
      @user = current_user
      render template: "meanings/edit"
    end
  end

  def destroy
    meaning = Meaning.find(params[:id])
    meaning.destroy
    redirect_to towa_path(meaning.towa), notice: '『意味』を削除しました'
  end

  private
    def meaning_params
      params.require(:meaning).permit(:meaning, :referer).merge(towa_id: params[:towa_id], user_id: current_user.id)
    end

    def update_meaning_params
      params.require(:meaning).permit(:meaning, :referer)
    end
end
