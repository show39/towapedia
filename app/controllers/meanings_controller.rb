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

  private
    def  meaning_params
      params.require(:meaning).permit(:meaning, :referer).merge(towa_id: params[:towa_id], user_id: current_user.id)
    end
end
